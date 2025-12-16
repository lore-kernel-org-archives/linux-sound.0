Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F143FC9;
	Tue, 16 Dec 2025 00:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765844720; cv=none; b=KUAYiMf1V77ielsUdfABIkokeHxNh2TLVjU3Y2WvToVQMqQ0i6mvEI2UrkdPChGkCu/sQUu23zHG4sJzYQ4o4p9A2UYQiGjCMWJnQx2zSOepk188JIB70vFtgukt27ryK+x6gROw8k5WpsKXtPQN4RQOV51UFjrDhSMPT0ajUXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765844720; c=relaxed/simple;
	bh=SJju++Ng3SSXh4VyyG/fpZAIPqU9nXk95mBWRMAyIcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OD1ho1jebbr4ase4WvKXZb79b7D945NvhlzEoXcO/Ld1HDJiyJpwwi9Fj2uDETGntcnA5AoQsXbD4O3Gv6aLxaCVLnz39Af3UmXQ8scGCLpkABw6ifmaHvCaaN47dkKvaPmty3ZlMRO2yeXYFkbI3yVppgiRwpTVeSTOp4CECrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eq2Gbkr0; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eq2Gbkr0"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFJCC642788589;
	Tue, 16 Dec 2025 00:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=snWcDOPmz+rmR554nf2c7zTcBCZrk
	09WoMEvdp77ED8=; b=eq2Gbkr0jr26zv46E5yojEIw0LCORWd9YXm5emwF8NzL4
	lAfxgliTW+KaXZUxCxqcZ+V3zgGCzYcb5X2KS7UZnAcwyYCMESSVMm6K1OKyUyth
	IzVQowowUsostPQM0I3mC7GWmHfmUTnAcyV7SA2KsooI37K831xmFkl9p6z32R0H
	weJfXEM32CxLKCVhTYxE1zYfU/DMv0JDqRSCVDE1xk9eoJTmzulhs0o/gzoxWD4m
	jz2I7htEUJaPiDYK9GBqVcfiVMwVeUb4CN7wwmrhNJQWYHMos8rMLHcyaDBuBs8d
	iWk8BkE1qknPcS3W43Pv38PDAU1NObnMnbqnfvsiQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b10prk306-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 00:25:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BG0KI8h005876;
	Tue, 16 Dec 2025 00:25:13 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4b0xkcmaau-1;
	Tue, 16 Dec 2025 00:25:13 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: g@b4.vu
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: scarlett2: Fix buffer overflow in config retrieval
Date: Mon, 15 Dec 2025 16:25:12 -0800
Message-ID: <20251216002512.3951683-1-samasth.norway.ananda@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512160002
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDAwMSBTYWx0ZWRfX7TIOVSAz1kep
 /I6vfohbxVDVZSfdYUWc+baV7wkYyUYHJAMl3p1Kaybfk/q5ryREUGeFYmAgws4ZeekSzAsqonu
 7EIq5bhOflOnSnMOUYAskDKme9VIT4LrEOd5jKARVerbOEvjC/3bxbQ9///3xXKsgb5j8i0yjfg
 7OhclSqDpwzBVF5vK8KXbM/M8UYA/xsorjOCMuDXyPGXjs1cKceKsqhmQqfPTpjEVccBs7DgBB/
 aP+7vSveFC0AoMCt1VzJBSFrmQMUHXUo5Nd1co4Bm0lvn6q3kzrUx1UXQEx6arOvOnOn0TIRrzn
 2i7p+lNnuQfPW/cDB0fQ31LZ1tZFl8GzCfdbPclX6A/1aoeM4XwfgchgYpDnPibE07IVEHB/q6T
 ih6IwHlzCzfkgsFvpiGuc6DAb7HcHR3TFWuhc0yposQi/5XLDIE=
X-Proofpoint-GUID: sqR9laavwjW9Aypu67cBdxBh-zqTcGt0
X-Proofpoint-ORIG-GUID: sqR9laavwjW9Aypu67cBdxBh-zqTcGt0
X-Authority-Analysis: v=2.4 cv=dParWeZb c=1 sm=1 tr=0 ts=6940a6eb b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=HUaxR9rN2OWM8muhoRsA:9 cc=ntf awl=host:12109

The scarlett2_usb_get_config() function has a logic error in the
endianness conversion code that can cause buffer overflows when
count > 1.

The code checks `if (size == 2)` where `size` is the total buffer size in
bytes, then loops `count` times treating each element as u16 (2 bytes).
This causes the loop to access `count * 2` bytes when the buffer only
has `size` bytes allocated.

Fix by checking the element size (config_item->size) instead of the
total buffer size. This ensures the endianness conversion matches the
actual element type.

Fixes: ac34df733d2d ("ALSA: usb-audio: scarlett2: Update get_config to do endian conversion")
Cc: stable@vger.kernel.org
Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
---
 sound/usb/mixer_scarlett2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 1150cf104985..8ec436cf10e4 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2489,13 +2489,13 @@ static int scarlett2_usb_get_config(
 		err = scarlett2_usb_get(mixer, config_item->offset, buf, size);
 		if (err < 0)
 			return err;
-		if (size == 2) {
+		if (config_item->size == 16) {
 			u16 *buf_16 = buf;
 
 			for (i = 0; i < count; i++, buf_16++)
 				*buf_16 = le16_to_cpu(*(__le16 *)buf_16);
-		} else if (size == 4) {
-			u32 *buf_32 = buf;
+		} else if (config_item->size == 32) {
+			u32 *buf_32 = (u32 *)buf;
 
 			for (i = 0; i < count; i++, buf_32++)
 				*buf_32 = le32_to_cpu(*(__le32 *)buf_32);
-- 
2.50.1

