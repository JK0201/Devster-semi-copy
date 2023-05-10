package devster.semi.service;

import devster.semi.dto.AcademyInfoDto;
import devster.semi.dto.CompanyMemberDto;
import devster.semi.dto.MemberDto;

import java.util.List;
import java.util.Map;

public interface MemberServiceInter {
    public List<AcademyInfoDto> listAcademyInfo();

    public int emailChk(String m_email);

    public int apichk(String m_email);

    public int nickNameChk(String m_nickname);

    public int emailpasschk(String m_email, String m_pass);

    public void dailyPoint(String m_email);

    public MemberDto getOneData(String m_email);
    public CompanyMemberDto getCmOneData(String cm_email);
    public List<AcademyInfoDto> searchAcaInfo(String ai_name);
    public int getAcademyIdx(String ai_name);
    public void addNewMember(MemberDto dto);
    public void addNewCMemeber(CompanyMemberDto dto);
    public String getSaltById(String m_email);
    public String CmGetSaltById(String cm_email);
    public int cmEmailChk(String cm_email);
    public int compNameChk(String cm_compname);
    public int cmEmailPassChk(String cm_email, String cm_pass);
}
