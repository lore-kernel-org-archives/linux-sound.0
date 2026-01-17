Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399E02C11C9;
	Sat, 17 Jan 2026 01:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768613244; cv=none; b=DqTLvlfJYCeszrbq0y0nblio7IKHmSQaMu9KZCoVI5YyXqgqPhtknGBVMrHfYFQ2f7Rq8YEC35exMvElGHMj5wHSuhrMsnqh6/mA4bGmAsNzd9s3tbMBpCAEj9knAi48Q9nPudKnGExNvn4fHcuZexLHR5BGf3tCGo0mzO7TKH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768613244; c=relaxed/simple;
	bh=SJju++Ng3SSXh4VyyG/fpZAIPqU9nXk95mBWRMAyIcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPhtrySd2x95UlKv+0bgN+jNq2c7jxynYLv73/mU/AnHcu9TIVjTV56XWTr3Ri0+TB1xgvRxN5L5QbAqP9qGGGDYtz6w5St3+aNbfX4W1H6/RlCsfDVOKAjIHVVRjs9KJyFvsXt6DUucx86fJYFOexRgJdTRpQKNbkWAjSli6F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EjxF4o/A; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EjxF4o/A"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKYs2T3916307;
	Sat, 17 Jan 2026 01:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=snWcDOPmz+rmR554nf2c7zTcBCZrk
	09WoMEvdp77ED8=; b=EjxF4o/AMVBCarjgtlaw6qeMGgddHuiwW4QRHLR8zU+wj
	odOoLp6AAImaTq1NZz0BXMFnPUmACqhhhxjYf24ju8ObugmfDP4DJJvE6xnESmoq
	BBCEoEoPFr8uEJ4RerXQh4n/gc7QsTBuEvBkqjzoBEMgiQwDRdXW7XMuskE4BXpY
	wIv1B9OnIRMCHPkjygLKw5fX0cPyRn3GEY07s5f3agIW2vz0mOeyCMUlBk3AypNH
	DhZfAR7ou21jZKlnoaydbJ6mYRf+48jieQn7Equka2bgjlMyykrjw0hDqWEn+k/R
	UTKzPGZdcKyfHzM4zO8D3CPwXSA79vgD//afep+mw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqvg4r9m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 Jan 2026 01:27:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GMtbx0010805;
	Sat, 17 Jan 2026 01:27:07 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4bqv9m7vs5-1;
	Sat, 17 Jan 2026 01:27:07 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: perex@perex.cz, tiwai@suse.com, g@b4.vu
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] ALSA: scarlett2: Fix buffer overflow in config retrieval
Date: Fri, 16 Jan 2026 17:27:06 -0800
Message-ID: <20260117012706.1715574-1-samasth.norway.ananda@oracle.com>
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
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601170010
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDAxMCBTYWx0ZWRfX24fRNm9TOCYG
 Xn9Gsz5Sa9l0XkrLARAhO15yTY3KePtOFxUwQlygn/AmKzoK+Su6otldFsqJF6Pd96/oDyzypEb
 vBosF1wRwCbfVZGEH7Fm59Yx0P50XdsZimNhp+6igI03iA5jLydsdn87Zo4ayBi66NaUbxBvUim
 GTTRo0tmA4blp6xZcTe7oKI6y/FpKbBWbzrr2dzGNmqJdREgJ4O4aCMBT3vhgg6LP7/GXxiTseR
 sFasAAKWKxesw0Jf2rHZnljyDwt/dnf9EskaAHdHoTCn9Q5WNGNuZXS8N7dTVKQbbUO+KLsS/xx
 QhSWRdji4BA4mQxL1hfbr1xzPWulcfL70RiRboIoq/fQQYJ+Fmi5+i9OZCtsOx1+KLOvbBrq0vv
 1+8jw9NrP0exS8bX6HvZAMqitRRvzMDjvlLCZzGcJghdm+D1sb3e1klN3pYdWiRAZ7i2aPzXQ4q
 Sn121JVRdPRkP3iwCHQ==
X-Proofpoint-ORIG-GUID: 85CEq8PyX4Sbv-LlvaSa2m8is1z6w9do
X-Proofpoint-GUID: 85CEq8PyX4Sbv-LlvaSa2m8is1z6w9do
X-Authority-Analysis: v=2.4 cv=famgCkQF c=1 sm=1 tr=0 ts=696ae56c cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=HUaxR9rN2OWM8muhoRsA:9

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

