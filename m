Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853071;
	b=Vpyayb5TmqlTrqUP8h+kD4ExwO4sg4R+jMEr+ifCvoDwUlaIcz8bw+qzbsxPvJ0ZoK46
	 8L2ziYLNUStAIPZQ/ySBs59m10kXqXto/U7ibGIV5C3DovTFhGPE7qXfDslP0zxvf40gZ
	 G/D0mkTIfOljd3VDLWzEYgdPAQcxhUyP7FoMsaGy0rOIoa2fThSJH9Y3b3yaiSOAFHFyF
	 ZfEa6ymt0i0cMYC3YBCibvKnikXq+bl94TcNx70PCHzqQReAcJ0o7L8ukN6sQHoQwH1dI
	 m9f7XQI0cLAJ8R9LQ+vAOiQs5u1JQYupQ/HaW1PEr2OpllpZ++rz9N8QBC/JAjoUrmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DnrlLC9aNv4HbXarfIyeAFHiBqO8dNsrY9V/ApXCObA=;
	b=2/hDUfBQiLq+Nvj+ZL6JnhM6wSIC8frDVWQ3SJU5IKVrcZcL4CqLLXMpur1HVgiwt9Yj
	 XICk60DWe5ufmPGjkrLQDbED3VVyuqamF53XqlTUjFIw8b9aWXzDpBIBcfVsqtTbs/CsT
	 VPXqkhTl/5o+bXaVEV6UqtvOWauwZV9UckVyuopYnKFY8gMkQStFNlDWEo8OGQtIDb1KP
	 0aGDeH2o3t8AKo6MRX05qpcmtdH9J2tVfqXZjj3n1TrkuWjvh5ELHPhJKaiZomFBLozHX
	 8pEKpb2XX24mANdv9V0kPuxweovVupiz3gvhn3rdc3b84pbnfrwH9a3xQz/qQU5rQbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EVuZNIG2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YPzu8YFq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD12E606A31C
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 08:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD12E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EVuZNIG2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YPzu8YFq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AS4dnrv2501497
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 08:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DnrlLC9aNv4HbXarfIyeAF
	HiBqO8dNsrY9V/ApXCObA=; b=EVuZNIG2Ygq7xyLvC3cHt9vz6vCQV45jIvgndz
	Zl5lL4Ls0m/55Hkyi4vHcl0MPcJ3Zmbl1pBSqL+Irp9yE5SqgE4o7xCxlheaFpxi
	31FcRROkV9NIvfOUhxoMX/OXrJLHEZcU0eTXSzewsVJECD8vnsOLuRCB4UWuE+1I
	yHSodLhimNwOlfOIeP8+9fQLKky4b7HFWCo8DXp1LWFY1sj074LI2sbCh1huKs7Q
	dJXUBkcXhcjpoRg/hV8P7HZ67dbcpZwULbeuY59Tyua+k+8VXVPSuWy+sYOR1VnV
	q35pObEi1rqkMxbIdrJmNsicfzgLiDONlUZex+DAd6mR/g1A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7r4j8bna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 08:04:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so8465055eec.0
        for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 00:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795853069; x=1796457869; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DnrlLC9aNv4HbXarfIyeAFHiBqO8dNsrY9V/ApXCObA=;
        b=YPzu8YFqk/8YtN8aUfibAf2lCOrJugMFYbUDarHhDlmgmgR0es+L5lspHMzbPlg0XI
         yjX9MDztNBNF6iNawq4aqztheFKKyC9zMi45WL68A2Y+R9RvYLs5H684PvT92vGmhQfR
         dlPe9+koADaeXye/2YhSFXaHcZO3QwwSjI8ErpaxoaUdApaUCKrjKNG+fdjNl+omf+et
         1sNLKcNlSHR7xo2RujJB8ZI51E3vxgZc8Vxyz24ZoEiYbA9NTAZ3cGMuzu1geUbY5xaJ
         2+nuwerBgBq/kWZGjhHRawwVh7xsutPcEphzVFnin41a0IqiFHx/qroILryBlcZLx+Ao
         CdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853069; x=1796457869;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DnrlLC9aNv4HbXarfIyeAFHiBqO8dNsrY9V/ApXCObA=;
        b=vVdGZ5oWxfBWVrN8T0ZCyfJ/bZarHVybrGLDFRSRoWh4GJE4Vr415JEEF9bEtbPQX7
         rWQyhHHFT+XmOpwYtqNiQrP4sMHll4IdWZSNAUh+tbDjYUJzxVYz4Kysko9OhbNXhWqb
         R/LlH1RS9ZDkhEfWJgy5cjSyieJwI7FtKHJnsWUXUfibYBY2aYxmpHNW86AD34SE2Zqu
         doidrmJ1HK+DpeAGhqrcOXBMolS2aA7cyl5dHdNVSSbyL3Jy1cwsE8Y7MVVUU06lqcqN
         ZI3GMBa1DkT42HEmWxyA8mlXkFMPkjugOOUCoOFFzoGTCeoDfstCaFFLngOnZdVyCLfj
         cJCQ==
X-Gm-Message-State: APuU4Z8iwybrpLd4bDZijGCKx/hIqBHgIIPcKoU1NVn6DbpzdIoXpPUi
	AHYpfWvL5B0fmYt0NUCDfGAyOMLSuLb/sEckIRYg1+12SvFUIbfqBbiPGL5ZSXKuIkqaA+MKYtV
	gPuG/VCUOe3TUVB3WqXYqCUnCGfphjG1V5j6MZCr+1yCpI/Jk7gs6+QeC8EGk+Im5AQ==
X-Gm-Gg: AZFdTZfwG5Ky2/VTTNvT7Bgqpzu+dKW9Fj5NL9hTLX2AW1cMt3CzNTMUYIHOG45A11R
	o3dkVlrlli156UujtdDZehMsLnAROBgHJWtcaSwuZlUvox0CPQRAiJtOFxXMmO4RruU1wzAJmIM
	EP/TBd0+n8EMeBofyzz+4tei7lttsK/UP806ZuF+C8MER+QPIHoSwhG0wPW/4opxiO+hEvZnIpv
	7ftuXqwyZiJr9hg4fVY1b5MbvU6ZfB5tr2U39WughVoOUapuWHY7eHskczZ4OfWTcTCz2sS5vX6
	1s0mrkgwVANya3ScH16WxfcyrB0l4SEhvmyqkLfHQP3phImXJlGYFWpQBhQduTVXCQQdE1GM6D7
	HifO3dT6/wFFu/Rx7zev2nTxHE3mUa9XwtAt6W5Ei69xqGP/k/mz++kyWktETN+c2XcLih0ti5W
	Rdhw==
X-Received: by 2002:a05:7301:6782:b0:385:2ea8:aac7 with SMTP id 5a478bee46e88-3852ea8d7d4mr36874382eec.23.1795853068955;
        Sat, 28 Nov 2026 00:04:28 -0800 (PST)
X-Received: by 2002:a05:7301:6782:b0:385:2ea8:aac7 with SMTP id 5a478bee46e88-3852ea8d7d4mr36874350eec.23.1795853068250;
        Sat, 28 Nov 2026 00:04:28 -0800 (PST)
Received: from hu-gkanala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm89129463eec.21.2026.11.28.00.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:04:27 -0800 (PST)
From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Date: Sat, 28 Nov 2026 13:33:37 +0530
Subject: [PATCH] soundwire: bus: detect SDCA cascade on peripherals
 reporting class_id 0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-sdw-sdca-cascade-v1-1-a97540779103@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANiKCmsC/yXMuw6DMAyF4VdBnhspyYDSvkrF4DgOuAOtYm4S4
 t0JdDjDN5x/B+UirPBqdii8iMp3rHCPBmjAsWcjqRq89a1zPhhNax2hIVTCxCZQi9Ha8Mw5Qr3
 9CmfZ7uS7+1vn+GGarg4cxwk90yINdAAAAA==
X-Change-ID: 20261128-sdw-sdca-cascade-8c6ab0089ffb
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, ckeepax@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: XM6EibchcileV4aAOo9Rep7AfjE3zK79
X-Proofpoint-GUID: XM6EibchcileV4aAOo9Rep7AfjE3zK79
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDAzMSBTYWx0ZWRfX7uBRbGCH32D3
 7pgBsNpmArWLJTjxpmQ72FqhympQcawLgwAPbnNIvngBbqqv8GD48iS96v/f80NGylgsVS8svfO
 FPLHo08HUU9gW0wGLOcnYay6KjulobNfayPwI/3Je5HjEgM7u2WqrwdYWugwq5NbujujF/Wp7IK
 zV7dKWozv+LSME9URhbYzmTAqK/+ZX/E2ixUzDkWExekG41kD4zurSC+sak/C0i6+7BE7Y13Sm2
 O2lK8tCjMofSo6CCTzizio4BmisejI+sjEjM1RJg2SCgdOQgP0/L9LJGRQ1IO6YRlu6q7pF8l6k
 d3wU7xZIhTGZWj98d9R/Brtz82uehYwyUWO6hC7kZZBN1f9gIkFfdIZCkZIzuxDDxbLtDnVCG5v
 9lUsDj6YqPowDNDuDl5XzhQApJoKKx368xOkl0njQFpk0cRcHRVal7oIeZSLUFKrdJcfA2aYsPn
 btJtUonJI/9p9LQi99g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDAzMSBTYWx0ZWRfX5LAYCJdxeIyR
 C7DNR0Vge9JvjzdJyCEAfTYJAE5gHX1CMNwfZsMcNI2K2NYtFk4DIo5Q/sebFwHqgyhLTciuNgT
 7MwneQAnlCsF0ZZH5uR6dkFMzzeyvlE=
X-Authority-Analysis: v=2.4 cv=Mdr5KJ/f c=1 sm=1 tr=0 ts=6b0a8b0d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=q1UXutW6kLyKz-ceUZQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611280031

sdw_handle_slave_alerts() only reads DP0_INT, and so can only ever see
SDCA_CASCADE, when the peripheral enumerates with a non-zero class_id.
That is what the SDCA amendment requires, and it holds for most SDCA
peripherals.

A peripheral that enumerates with DevId_5 == 0 has its SDCA interrupts
left invisible to the bus driver: SDCA_CASCADE is never read, so
slave_notify is never set from it, and if the peripheral also masks
SCP_INT1.IMPL_DEF there is no other path to it either. Neither
handle_nested_irq() nor .interrupt_callback() is ever reached and the
SDCA regmap-irq handlers for its Functions never run, so interrupt
driven features such as jack detection silently do nothing. WCD9378 is
one such peripheral.

Fall back to sdca_data.num_functions when class_id is zero. It is
already maintained for every SDCA peripheral: the ACPI path fills it in
from the DisCo tables, and a peripheral with no DisCo enumeration seeds
it from its own .probe, in both cases long before an SDCA interrupt can
be unmasked. No new property or quirk is needed, and nothing changes
for a peripheral that reports its class_id correctly.

Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
---
A follow-up ASoC series enabling jack detection on the WCD9378 SDCA
codec depends on this at runtime; there is no build dependency and it
will be posted separately once this is applied.
---
 drivers/soundwire/bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index aeaae5a57c89..4a88b2af7447 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1693,7 +1693,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		goto io_err;
 	}
 
-	if (slave->id.class_id) {
+	if (slave->id.class_id || slave->sdca_data.num_functions) {
 		ret = sdw_read_no_pm(slave, SDW_DP0_INT);
 		if (ret < 0) {
 			dev_err(&slave->dev,
@@ -1833,7 +1833,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 			goto io_err;
 		}
 
-		if (slave->id.class_id) {
+		if (slave->id.class_id || slave->sdca_data.num_functions) {
 			ret = sdw_read_no_pm(slave, SDW_DP0_INT);
 			if (ret < 0) {
 				dev_err(&slave->dev,

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261128-sdw-sdca-cascade-8c6ab0089ffb

Best regards,
--  
Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>

