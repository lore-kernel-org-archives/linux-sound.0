Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713698;
	b=jBS02ikE8Bu4+2Juinj0P9a1zSZG3DV9hMS/5SYOeygYpiB9AmKA4cEfTg0deSvoA/Oq
	 lqd5r6j+1ZDiuaEXgPvcEUpDwRVhAlO4MMd9nNw8fF06bn9uC6pjpsmu3cvaPXu+WbPus
	 osQelsGy+YoXAhHH+A6eU467O/VS+07lErt6RHZ2t6X1DKD4DpMThtjkwP8JGrddknUOA
	 qNlnbVq9/GDrqXrRCKr01YIptIxbS73lD05Cm6So5btY6vG97rT3BIqGht4UVQO0FSAyV
	 QWKd0PhmLU1JOY+RjY114U8Fe0tAMAu9ybx2s0kJTJMKcW3SBispZx8XuSJS29xOh2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713698;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QMKVm+mFH7XNX3dJ+CLq5uG8xadpJM1yNzclNMJoASw=;
	b=ClW6LH8n0NW1vmlj4gpLnK9h+vo3TSkg1BRNG0fAOpWErUoy6/OL4lKjeMhfi+3OIM93
	 0g2iT66d0LT0MQburFmcaQWqpCIXa+ele0qoVWTw8ydhTMHdDeVpdsFagM9G8jtoLrJ4b
	 8BHWkW7pPp3gkUGuNpoC+WkueLvA5ia1S7bHKfHiwckSIDfbaqGqJXxOVKWkVDruCOxSb
	 E7Nd5dwL2wRPMSGe4RDpFpaIQstNafJGuPk2xocpYXKm531s8TLHQu59rpxmWO4yCTb5g
	 fMKdfPy4nhbIowIKJ1w2A5ODJ/XnAIwr0HG09hLslFDuTHQJhJhtV0aMzp2URZwFQSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcE9shxk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dB5/14SI";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D13E606A324
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 13:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D13E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YcE9shxk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dB5/14SI
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3DZKko3002417
	for <linux-sound@vger.kernel.org>; Tue, 3 Nov 2026 13:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QMKVm+mFH7XNX3dJ+CLq5u
	G8xadpJM1yNzclNMJoASw=; b=YcE9shxkeYClE6VG30Kleq8AprjzntTetuIpYu
	A3BnCTaDZCWgL2gZTOO+ripLJuIik/67bHIpmUCpYCoh7m+aXx5Q4T+FEb/N5bGr
	Y7BF4d78YCwUyCZmiK8tXyR0OD60dKc+CsN2AHyiaby8KmhPzSRJjrd10oeZL9cy
	M7NsGMC7FoMhBVWtNO8Ym2FWJ9XFJ9VV1Q6RnJ8jMHchchw0QnF3AACQMqPWNHyA
	9tCyFnouWueZJKt5qYVNg/T0U5v5a9YD3KxbXwBhLPRD41Qu+TtkA8pYpDiqh/xo
	EiIVgtQaf6F4XsyO3nEN69U3uS6b63YxmSUSPdCGZT5nae5Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0873yn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 13:48:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so615076085a.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 05:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793713696; x=1794318496; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QMKVm+mFH7XNX3dJ+CLq5uG8xadpJM1yNzclNMJoASw=;
        b=dB5/14SIqvn8rITO7K1TNCWYePzuYRJKmGePR2rH9Fa9G617qgYK0o4v0bMBNQur5V
         uqmgKpuEYyEDnSEPLSEL7EUuNOlHDmHK60ljwgZY9xgTkeyyyWhLJRq7eEJpnY2NjHt/
         z/KbN5vzY3XGhodexmLx4kRlT+PC1HEhPsSEL5hm2NLADTxG7wKvU9mT7PHa32kXTItZ
         glDietFntU1qTd6HlNAbVPgkrmbIzXJQ7jW3eIFggRrQta97ipBIG2YrkmV1/lsbwJc4
         nZNEzvA4zE8FPTTOHmCcywLEGKrfz49CKwJ0j7JYn1GCpsoQ3FXr8JXZ9kVkKPq4rv77
         ptEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713696; x=1794318496;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QMKVm+mFH7XNX3dJ+CLq5uG8xadpJM1yNzclNMJoASw=;
        b=M1fELT4JNMDS1I5ZbcbtDp3UunjISPsWK7svQ5lZKrdAlAC+EaYNZsVFDeCG29tYC8
         u99t9cRdS+MMiUdCkrhmAdBQQI6kE2tikdEw+MSJLBW6jm4vb++k9cmUIf9alelA80Pa
         uM0qnVgCDZJYKB6Uh5fOK9VRZ043uPq+jrh9xVozgpOkoByt9SlZwlwv6OpEvcbn1D6L
         izm3gGg1uVWyfw16WJIOeXjcBxxTc3MpxyysDf2yN4IcX6X19mQGng/EPHnp46CWiydO
         LwrnXd7EjjnODgiFU7M30skxBWwKEWCpEB47gYpWbyN/3iBtWmJCK9wXO9aLKD88WW35
         ylMQ==
X-Gm-Message-State: APuU4Z9njNR1u4itDvDpPTWXximMyWXXg4GUD5OzrwlI9Dd84jHhj1Ar
	dbQ+P+pzygumUcQPchXEcbvqrxrzWXCfrf+IjIEYixM4rt2c/H4kXaVFVx6+4qx7FD9kGP4c3j7
	3zh/8J+HzNdqDvv5dcLok0sV8BDNane+cT6biY1RGdWN1LO9dACf/RlzZoZhXeqQOJw==
X-Gm-Gg: AYBFou2p3/Xe6x7zDkXF0uPV6eo7H09uNoOjNcuMdVkkIgs5ekVQ02m2J2J+uMmNxja
	VkbQsnk1H/S1vE5U6zl++hUIhnIy//YqQxxwXIJkrrr+MlhKyPxxVZ4f7XDSotcqIVaG28Bn6FS
	xN8Ze3Ptav6XFQ9pgUsJWKEXkQmyAr/kAk5XFWl2dzxGMbwvtxO5TGrDy53Gd4WDQity/RKcsLX
	R6CHP1Mu5F3RSOBjOAFZwcfosoTculqoVL7n6n8qSgzNZNaBqltS66tAT8Vdh39P9VCtv+/L7R6
	yZ6F8hEfrNCx4rTu1SLq9uzrkMqPCNYyr50F/XEJcYMC165omqib69vV4imdmS/CKPEF6QBM8ZG
	00uR86936J4YF1p/5eFRcc0Q8IzlCG63y3i6DqLOTI1WvDB9lnXfdcmrcikqdRdTPZxFTGNkFxh
	7x4Q==
X-Received: by 2002:a05:620a:2710:b0:93a:2e8:5af5 with SMTP id af79cd13be357-944214dc4d3mr2082622785a.6.1793713696456;
        Tue, 03 Nov 2026 05:48:16 -0800 (PST)
X-Received: by 2002:a05:620a:2710:b0:93a:2e8:5af5 with SMTP id af79cd13be357-944214dc4d3mr2082618285a.6.1793713695970;
        Tue, 03 Nov 2026 05:48:15 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm64445875e9.4.2026.11.03.05.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:48:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:48:12 +0100
Subject: [PATCH] ASoC: pcm3168a: don't request the reset GPIO as
 non-exclusive
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
Message-Id: <20261103-pcm3168a-non-exclusive-gpios-v1-1-5cfdcf36c915@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABvm6WoC/x3MwQqDMAwA0F+RnBdIKlS3Xxk7SI0a2NrSMCmI/
 27x+C7vAJOiYvDqDiiyq2mKDfzoIGxTXAV1bgZHzjNTjzn8evbjhDFFlBq+f9NdcM2aDJmePAa
 mgRYHrchFFq13//6c5wX8WIN5bgAAAA==
X-Change-ID: 20261103-pcm3168a-non-exclusive-gpios-10918c1070f2
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5xo07OYm0SeDrgdQSQeYnj47BAStuVdTnBufjs9Uu8c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eYeaPuq5MOiXyMJQLVX11+K5CPHddyNo4VCQ
 EKxe4wsrdSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunmHgAKCRAFnS7L/zaE
 w/RnEACVKHXpPbQLfWI61qABDe8AwFPmGd9guHC01zlwTBbanUyvNA3CmYHGKtMGx1dDejHZxwi
 uYAsr1wO5Bk6Izcbd4z7vZxKZhkTXtgtZ/zBLy0JZKZr5HsD1TKQ8shj9RR5LyQC94LyC2oGAX0
 VVrWNZF8vjuhbppUvhOWJG/n5b7Grot1SP9gFocMpyxqiprbtKPLECJtt0vefOh+7nWLB/0r9db
 lXpqatfeUA1BO1nZ7dXcle/0ffvTgi8p+Zb7aPpHWhx/LxTJdYRkYb2N06OKgfciaHz5jz05qtp
 SVkvpCs/yI8VSsrhPcAf4vdhQ37Z76VI50wHgUbbHgGxTl2WB7W+1h7OP6WNbWNrAZDudVT4usY
 xcksA2tB967y1FucpTqOCGqO1RQgLo8/krlhjk2R3jwh4yESXiohonYtLhxG4px/Cjal9+lWOK9
 4aHE3T0Fcaa/I5ZpOGZbf+uDhPpTuD1EwCB0991Xgiyuie2cjRkwigNH3CECU47wZGYukD+KNUC
 /Gz3RlVXa4HtwqdB9bo8TaDpVjDaIqNU+1BpjMb7tED72CHU5kCC4HbkdL3B34o5bwe+PrF8ENX
 /n841MLPdI2axz8LKeu9885RwjEnOMcJ0PFuPSKGAq3XUGEuYUHaWlCSE+vz/krmoYrLkkD44YJ
 mqwVMakQHGYDv/Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfX7boOIfkYWnmw
 6O6/Gh02slf1F3Td1MBarwcCnQFuEKWlsARttPp2Mmpofw7aUNMdsNZrrchC5t3FJcXCEsOasPu
 FPG87y1iibk0TP6ua6kQhtmQz9J2HUs=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9e621 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=RTQ-KL1RhNhVEIJxQikA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NCBTYWx0ZWRfX+PFR7QdTXsl6
 TIrhM2vZGVDg2wZfJMuR+uI5obZp+QpmrbQyCp2ux5lpin7nBxEEWl9R3+Il3aNG2c5KVFqZTvn
 ouOZEv3lHmcp9BdWWGCAaOdiZH2O2BGZ8qXlOtnZklTNzRIFs02hiCv6DDQ7YS8aOkjDVFQlqDq
 EZiHoehTtX3ELkhVM+bzgGCrvb0jlv3PpwNPzIzKDqxGF81uNPL+s1G/7rCr1P+QipwdVyqa69X
 pWSXuzHrF1fVpQ+KbrvoJVBBQFEDNh3OTmHl2ppqwue2ZF21VxNYoDBKM9oYb8clclQTil0sHYm
 ZOnW9tAy0BhldVU9eI6haRQ87bNisldVDgNpUVY2asUrTkJUZtCqT6KuFEO0+GLSsCgqN424hgD
 KzQSDACvnZxYX8iJYIXsauh5BShiaQDfw/UeOEKcFv9PezHDzMo3fGYvLWiVO0hgcLnoOyyKBuT
 4LWPDQ1lT4Dj82pqehw==
X-Proofpoint-ORIG-GUID: pjC2uxwBVe-XMxY83AB3LNKuxknpJADw
X-Proofpoint-GUID: pjC2uxwBVe-XMxY83AB3LNKuxknpJADw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030054

The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag is deprecated and users should
rely on the GPIO shared proxy. All users of this codec driver are ARM64
and this architecture now enables automatically shared GPIOs for
everyone. The driver now longer has to care about the sharing so drop
the flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 sound/soc/codecs/pcm3168a.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 6f45ea4869a75d77344b06e1092aeedcea160058..c1a263216ea6d88757053e93d782b8c8c01f8d1e 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -725,16 +725,11 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 	dev_set_drvdata(dev, pcm3168a);
 
 	/*
-	 * Request the reset (connected to RST pin) gpio line as non exclusive
-	 * as the same reset line might be connected to multiple pcm3168a codec
-	 *
 	 * The RST is low active, we want the GPIO line to be high initially, so
 	 * request the initial level to LOW which in practice means DEASSERTED:
 	 * The deasserted level of GPIO_ACTIVE_LOW is HIGH.
 	 */
-	pcm3168a->gpio_rst = devm_gpiod_get_optional(dev, "reset",
-						GPIOD_OUT_LOW |
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	pcm3168a->gpio_rst = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(pcm3168a->gpio_rst))
 		return dev_err_probe(dev, PTR_ERR(pcm3168a->gpio_rst),
 				     "failed to acquire RST gpio\n");

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-pcm3168a-non-exclusive-gpios-10918c1070f2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

