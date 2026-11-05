Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868155;
	b=wQ/m7va6vcU15yRXxxT5QtqVuEypJ5KtVgJ2pn01fN50AC7B7mEdr6bpYMaKiEMNJutC
	 t9AXvwn3+2AAJl53njavBTWycoN1GB9V5WWBuC7qa+Gu9jSBmBxlYVxZCOcRPuFvUoLn3
	 AeomEFXkAVRvIIvxut9trH6U67Syz4l0ZZp0L5Mznv2D6tRMNMnnKtBvwT6B10NPLsu/B
	 /RSdpIDf48WVDen0QDlJzsHcNjNVagIbzIodc97cwyW0VN/1uAeMCg0XmiEdpN/nh2063
	 QnteoKt1+QUUbta/tOANpFpLWXR7FTWz6AUT0icAwFZYn2ozLPkDMbaXYvgqjK/BqSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZjM2RPR8MuyY7swVyfY28Db6o5AjdPyIfrWtJgN5Fx8=;
	b=fVGY31BRKdfyBEsKR1j4D6Y+XwWfLNM/zKbm00+yPMaU7GYv2d+hKcCUyvlHKmBIJx7M
	 YvD6Eec7dLitb9fJaTC0CGBPltHpk13T7TGDb1fPxGP8xTvdxjV1tmsf4sP4vkKvlibWz
	 KHfEnkOru2cNa+vmTHkWz9XUlZxkNb5Gxv1P0RYsyOmlgIuvwEmVW539P7v026Zz3LISt
	 rM0lRgyYF8LyhMnyry/tRPraH2NiqDrNz9Ig9MqXpbqh89ZT5vF70GxvXdDmSvsEKbSLQ
	 8qc3yRKs1TMFLONmwAItTe7sMxj7Up4PQyw0chrTBBnb/P9RJIoSRyEAM9uPYtHkgWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nz9nNfDn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fUenW1K7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05707606A32E
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 08:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05707606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nz9nNfDn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fUenW1K7
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UbbR3624943
	for <linux-sound@vger.kernel.org>; Thu, 5 Nov 2026 08:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZjM2RPR8MuyY7swVyfY28D
	b6o5AjdPyIfrWtJgN5Fx8=; b=Nz9nNfDnWomMg3OuQGuzkZBA5pS40urQnQZjJW
	TAazBiVPIH8N0C1BF4OVCuGlivdUdMx0N86LMjnynr56noyhNpaNzZftsnxojVGD
	JAhy/rKu+OrGuYjaaAtTqtpNA5cQjwkvekDk5d5XPgS9e7AvOSk7ixEpYJvzhUwP
	DRXNrsxKhxmZwuYhd+DouKRgUqIBu5MmP0YYtOHuYHHsjql0La2xYE4xxYmtkmI8
	QmRdiAZqOeM4/nE55v6TJ6v6SFkqGm2hFfTo2u1DeYwXqPMMv1E87IBuzgNG0vo4
	HfktD/ZLUaGyoG+e7su+QAtTIBxmQHzI+VJB1Y4/f/8YCNRg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br424x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 08:42:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c8a517107so44793386d6.3
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 00:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868153; x=1794472953; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZjM2RPR8MuyY7swVyfY28Db6o5AjdPyIfrWtJgN5Fx8=;
        b=fUenW1K7aZ6v+gWC9+pFwMsIIVH8U1b9CQ+bqWD3nfvVyz8xEqSbYYIJLz9bXkQeWl
         t2Zc18DtPZX2bvev9w4LtiKbCPg4/JJxzHtarlL/7cT/pkdw9pz0BRLORYSJXxbWrw6w
         ywqH7Aaoi1j+EVAksyUT6p6yZpyaAUUi9rUtY1gLVLce9LKPmDTdMHGi+h5OC4hgODZD
         UmJVxsh8Yd1tI9Qxfk5RieaduOIWl9GvTFtQI+N9NmYz11PcxrPMBwcaskuNQsG1s4fK
         lyTqnhd6cyR77Gj2XjYIGfnt9MVhDcaauutkKtGfT99XS/z4sk9SWxRwT677BVZOY5ZP
         ayxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868153; x=1794472953;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZjM2RPR8MuyY7swVyfY28Db6o5AjdPyIfrWtJgN5Fx8=;
        b=cmRw2KyOLnIyyHbv/FzNtW11cl5eRDYfuFbtk7BbPX2J3k0f+b63E9TIhHUdapwIIi
         mVcqH2Ii9NshAHQv5RUTnbaYO1GkrXdKmCNQlPlgI2xA+WnUgBjg3XN7akdQ5T5kAp06
         Vk7WVjNP2SuajbyJMhMIPtX7AA8Q0mFTiAVK3BnkZL7YNMTvJFyV9k3gBJ6x4KCRdPVC
         fuuyfKNUlHQnjf8sqJVEPhc4zgJqu1lTmzTLSJ0Lq5KJSRECcbQiWz7vqkQnLEsz6Eiu
         0tBpoUrnkxhf+WXr2mFWBn4pntyzikrY/e5yNJpgjtl12TW60ky5zxA+2EEhKtYAtXAm
         wTPA==
X-Gm-Message-State: APuU4Z9oWPGuJxqDQ6vsgpo4P8TQXE6QdKNu3ZNlZ3lvIv6AfZTkVGtR
	b5fwWo1tzd96kt1qgl12FKyA7c9F1YPkar4VYWp+FnWeFg6d5C0DN1rRKlxSQQcz0D/RZ5rX3F4
	auKOK1XoxKvfWaijattSc+riFCJR7fjySrLGy+pViqu9pvbCAFZsusljqJxvdqcs8cg==
X-Gm-Gg: AYBFou1aOIs7BWla0E7uIclYEBh7dHVGKiwGwWP0xjNMUItjEjkGzEUELmdoaXnlDa+
	r+pnnirhQDwFZ3mm/goc43i/EIlWTVg+5xqyZWr25KsrLnStQNeS5SVc2j6JeGFDlenpqajpWA+
	MkSIua80iA1FGQWLhAQ42yWMGp8sa4mYJPaynrJ0V36g+dqjD2Ars7rtzRAmPg1rtd9d8oIcIoh
	O/AkVMVZ+nI0XfJ1M5fToRCW04771N1YfCY+BtWm6Hjat0JL5oC32JP5qqyWbqQWumM54g/qapK
	9ubQYNM5DMfd2q0pDACDvCxZsvJ0WIh/Vy1eFziOv0sF5sPiBWvayQgp7Jzww5tQRsplpK0OxdF
	uWR4JsGM5Yskj7vMYUinMBlTRHQJlhl3SLt5aRp7Xyrvn/7afEdGrf9bbALxqgwUJTGfrLazEft
	5u1w==
X-Received: by 2002:a05:620a:4155:b0:93e:d364:c9fe with SMTP id af79cd13be357-944216970cemr2986439485a.40.1793868153063;
        Thu, 05 Nov 2026 00:42:33 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:93e:d364:c9fe with SMTP id af79cd13be357-944216970cemr2986437485a.40.1793868152534;
        Thu, 05 Nov 2026 00:42:32 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm89119515e9.2.2026.11.05.00.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:42:31 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 09:42:25 +0100
Subject: [PATCH v2] ASoC: codecs: pcm3168a: do not request the reset GPIO
 as non-exclusive
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
Message-Id: <20261105-pcm3168a-non-exclusive-gpios-v2-1-982577248ed6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHBB7GoC/42NQQ6CMBBFr2K6dkinBARX3sOwIEMLkwDFjjQYw
 t2tnMDNT95fvLcrsYGtqPtlV8FGFvZzAnO9KBraubfAXWJltCkRdQ4LTTmWVQuzn8FuNK7C0UK
 /sBdAXWNFqG/aGZUUS7COt1P/bBIPLG8fPmct4u/9UxwREApyHbm8pBqLhxfJXms7kp+mLI1qj
 uP4Aspf3X3PAAAA
X-Change-ID: 20261103-pcm3168a-non-exclusive-gpios-10918c1070f2
To: Cezary Rojewski <cezary.rojewski@intel.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0tWsyG9rE9BQEfezWGVo7jJJr2q9NPf4/ZW7zU+IisM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7EF2kBLqD1AN7auNgWegCGeGIznSpzpZlns8A
 zTsGOOnzduJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauxBdgAKCRAFnS7L/zaE
 w2gyD/9ROnXzIksewPI+X/kCHlQtC76Yg4XD7AKhci/LrWlZWkcntWkOe0rZ5GzBhqMbrVcZFHI
 5xPqoFjR8HdYlbw2+Fu+Ifw+bFDQ2vsm+OC3Vm8gvfiWodHXl6Bv6V2/Id1t2ajm8HhCG+odNB3
 opOjBSZmOE9GySD71RrklEIHo2kOK4pUAY9E8gJQkZqvnLSOg22jkIap8yhn6FrEB3M4MmarQNY
 90Kz9FlXHDqf9ZSyNtTKc0LpSSI3RYqMcYoeLrwIGiTmP02CPRs6Q6HO7LhVgHE3izzPaSe6MAn
 b4KskzwUkXbwSm0NBLWTMEDnRbA+BsJIWzu4wzGhQfAPoFI9hnD2LBcMAoPj7CLZDfKaeW7BTHq
 L1CKmRooV3jfKVWViY/MoGxt7fMxQxhVZhUW9rJA/BZwxvZn1j0Qski6V1SloIArTF4Agaji5tX
 Cp1gQNz0AHBhP5ky0gS7PM4rR43djHSX1xcxa5C2OY80thO2UCiTxUqB5ucUCHMnhTTGuPpwvVE
 0eRuy61vfFX0PgFQb1A1PAeaiylMAyVgVfNcvcxSml30epApOPlzbDvJqjuavm2oFVFyxb4BYns
 ixG+KUTw5sY7/EXRO5dQAHMJSGU7b1vvE6rO0jnjsCzGRFti0A3m1fho+Tb7mlU2LTuqXKN88IK
 AfXz90sKumn81cg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfX6yacRzxMD9FL
 WS4ZfaCBvCNC90vNgadYBIA7iMEWP+40tD/1c+O1gnVki2nkVlVQzMQcUJGG+ErECV+/cUS0gc5
 sSNFR3hI60sB4YX+H87yb6vzQmr1/mJWHerowr7/I3Z6pCHx6b/XEsuAHC3KwfUv6mFyeJ4Bs+8
 Z4zyZET8RXvLgv2/rKB8cQv7RnlG1sWUMP0otlEVWIQvbnicfz5ZTXJAAwWlg8vkFSubrhorjEe
 o6mJ5Dfft3OIHwi6o+Eg4gboaqcV3/xFiFSOQ3y8a9PWSgTAat8WelLrf1ksTEEictBfT73HLal
 qBjVx4AzHgySFUJog3SYqbRBWElPAEwrvj7eAvNHtTiOdkF6okssQKdTdD1k6KgJpbw2gS4UcKC
 T8503j4mFrs0okmIXYlA2kbbtex0jh/YiZPDgExvHpreEefK67ng+BZJ+ZOdgMHpFAChPBPkVlY
 o7yBKAO40bWVUeJM9iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfX+q5oDR6MGbKZ
 zbwfFcMXu+z4ou5+dtYEC6VGMipXW4WIiioe8qlllONfaYV0ichQbngZRnJOn9RQNHpd2Ce5jei
 S/Q6J/Vwx6CqNj0oZuWar6jJKqEeZK4=
X-Proofpoint-GUID: 2nnO6UO-VYNSWOWOwfLguxo0YKVD6ZaC
X-Proofpoint-ORIG-GUID: 2nnO6UO-VYNSWOWOwfLguxo0YKVD6ZaC
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aec417a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=RTQ-KL1RhNhVEIJxQikA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050034

The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag is deprecated and users should
rely on the GPIO shared proxy. All users of this codec driver are either
ARM64 - this architecture now enables shared GPIOs automatically for
everyone - or x86 and don't share pins.

The driver no longer has to care about the sharing so drop the flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Tweak commit subject
- Extend commit message to cover the non-arm64 case too
- Link to v1: https://patch.msgid.link/20261103-pcm3168a-non-exclusive-gpios-v1-1-5cfdcf36c915@oss.qualcomm.com
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

