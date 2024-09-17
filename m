Received: from sonic304-22.consmr.mail.ne1.yahoo.com (sonic304-22.consmr.mail.ne1.yahoo.com [66.163.191.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8CE189519
	for <linux-sound@vger.kernel.org>; Wed, 18 Sep 2024 23:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.191.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726701571; cv=none; b=U/vWTdA5rSRyXt9fNCwsIEHiTZxeZvTyXvYfLFwPCXfYHeZf5k+iIn+MRxkuNUnETlQ0ArohiuH6BI5ORVZAT1/wPmlY1nmJch1Zcbjw5M9Je+yodDnzS08Uyrs/e0Vse7WMFnPfeuzMy+l2v6peYOjaiZYhoyNoEHHChbtaqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726701571; c=relaxed/simple;
	bh=jBvjiVJoVl3rayUOpCUuDtc63dyAwl2vmEGUv30trLo=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:Message-ID:
	 MIME-Version; b=MvvYirNUDykzjeh8NC4pxZ1DuDIW25U2qR3YBcAETyazfmEVgGyYUBEzGNP6u3qYxgWCdgiPRZGVv4/bR8jAlvup+XZjx6SVN3AbDZeMIUncRUUNIOU+8laEI5khWwJKWo2d0cEKXspR62qlf8Z05vWyerP9QtGtJyhMvtMJFT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=KtbA5n9u; arc=none smtp.client-ip=66.163.191.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="KtbA5n9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1726701568; bh=w9oz0JDhCk8nyqPRrbyfOr4o1i1aJh/C88iTJujUcZ4=; h=In-Reply-To:References:From:Date:Subject:To:Cc:Resent-From:Resent-To:Resent-Cc:Resent-Date:From:Subject:Reply-To; b=KtbA5n9u5nQP9d8Vay5wS6s0NE+h6XLJvUYFwrZrqhn8u1wyu/w7mWydrvonMrdrdICbYMkiZp14fWYpaBUg8GjPGel0xLZQqDlQyF+lMhx6AZLSfo8VOxGdHPjM0J4v8IzTBBV1uSQJ/uUQhvRR+5dqLRvR8E430EpWPH5cXSUqAMIteibvWvHTzaXb0RhFpD87uOECzMN3WbRV9Wg5BNtQQLhs1dwERsiP6aoI/lYYml/QDsujzEPbn6pXUqfVAwfwmRldGOt5xhD5mEekObbe/tu4/vjV26FR0U/VP2suZ2+h1BguyLAw7iOFntVzBDgaq7eqRVRdYCfQ/oMnpQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1726701568; bh=HUavcJBO7gmeQb6pEah6RRIJY8e6Hv8QRPqxhYEKBvg=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=Wlo96Dc+L4xWjLRJrTNHQmmAC4H12Pz/7Z84QN/S6KJc1Ncnw0bG61W0FQiwoSkz5qrd92rYfA26XaBaD6rPAruaBmIXaQk0XIbdk/a+WeY8VcfvJ+53222J3NBjXWWY9xwc4NVwJXFSqgQbSCHKvtvy8c/AuoszMQFLu5AQSwfx+Iqsv5U6nKQSUjPVqyebPu8hVrlIVK4XC4uliZ++Wl0Sftkj1CVRBlpn2mzdBWtJQVp9HAC/pHd635anniDHNZgK0ixbQz7s58WakiGT+xOGpqdx8lkckA++c5EThycZrmAWG1APMRSJVtrRqC0NFSSsqcAYsrDGd5aX4rEA/Q==
X-YMail-OSG: Mh65cxwVM1kRYPWmWZ5526xkRZM65bH9.yfXAtx6.YMFuTbCBlyMnBH0_xtWmvt
 xOFkrnFNUEqhZhdCWwoZvck.ZOCYDb.wuFoLZ0OM.6d4tdXWaAUYWHpDo.QiCgX6Q49C3hCzDQUe
 3.u2rDVxOq1q4CM5ouwHWy5OakT8tVKydFYitIu9q2fVxVxbdiOvicaDesiq1JsQpICrgKuS1ZEF
 NtmztAIPjll7.y1AwIW4BXbYqdAR3IbW6ty8rahews1K7SvYDZbHFZ6xnJBhjn2f9l0Wp2cIzLv9
 zyU.6jguGmDvBOwdFoY2uixW0WOIzvsJABWTojQpsd4p11u2EWFNk3MUx8E2zBWsCYEDXAUCAhRW
 uhuDDmZIDE93rmVQU6bCJvY4Mci10TIJod7XQ49uOc5CKwVQrgsKHyqgm2l75cmtHSaJCOzXDCLO
 2Hl7OJo_PzOudOPdLIgYIxen8XiAZumZ.xFFy5vMBNhM7aJv7t32l34.uOG3vTNoLZvAji0phsdN
 OXvqnXbdv.6UluEC1Q_Kk3bAVkvRgVwI94eYK2zC00ieNTtCS9w8ctvnuhEipJ8LKGDPhs0SaPgm
 9O14IkH1w0i9AfLRXuWnU838x6Yjlbl7AJk2IQ8fmMjKNRQ4Tded9iaPINMPCLXwuwUJRjEh5n1V
 J5KHFl.XHReNcc72m7mCOdDaZ8mjzOmUlrWyyo1JNh.Mj9cMggEQ07dM03jhmCvnw7VVQ9ol1E.j
 UaX3Hw5wb8d0KmhslgCb5VuUHbX3X4ZiYXFa2LJePcQxTdqtam_ZnwkhnNE3Kin9rxVbB4Uvqk02
 VTB5YcqmzGF5_T8JcXuQSoY8saMen3lYZjtxtB9Y3U.Tdbb4ANzc0munNPvD3n3l4N2BfTQ4gdkH
 aWFMfnDXxalPxN.4U0qNo5AEHo4hfMIBXI6O4lAM..dFegWLWC3esNvngMtC5oq8rJ3Y23zPFMDv
 mWSsz3EFACelD9RAOR3r1aWIqQ41HbsP272xkbowbdQELEKrDekDzPZUakFq048gyOP2B9Qaxasu
 qcdhPfg613Hpvp3U34l1sk_cyEPZx7POX_DZy0bD3ftT5nyt2XppMcprMavjnulm7uSpFSJh3eI6
 .jkJ8YRGVR7kGA_ZLVOmp4gfWNSaUx3Shu0Xhogzn8fasgQisccwPqOTGqb061wIjNrOD_tOQXJH
 .v0cul9inBNvUG988X1jKOAslYtAF6A4XzNRrNg0w5XyjnkFOzYYOTJwUrptvA.Md_zCK52P77MF
 sC_2l.zYgbz_2sRIA9VkL323gl6tkZ.CauPVzqHI2e_5mcIS88jeupEDhcloVzPVqp9vN7h4lxk6
 8n3xz42oAQoceMQCpaEyHm5NU1EJz1QUnx7MeqN01pi4QZlW5Zew5TU7v2ssdiqzVbuzEW73qBYs
 mDCkdswicphsbBY_1wobWY2YwRuvKlyg1dSvPV7I.Rd7UvoI2w8jsc3ThFw8XD3bFI86.dMTGHR.
 2ji4nBUhOd37Ikq7VW3vag6O03TG4fX3bOaPhnvKDc.UBDNwMT6lVeIlmUAnrgQQe0sZbeBAtN6R
 KOwdvQ5.ugxYUfxNfjy1jjAF2YIX6oPJWfO9STOlTaBAZEgpHfLhaWu0e2VhpFkwuxg1xAisyr_y
 cd6TaZDw2IGZYFEfrfh1Ij1mO58XT38pshMGNcQI7Y6cIohjVDgJJCZZQrZKwUEkgDlvIDnt2s8D
 aaZRSlQjNOIGc66.c7Q.Ello3ses40n9cBXbkj3OQ_nzOZvOjhu2Jw2NZmUid1H3vEcmuO9bfcrj
 63uLXwhVfbpMuTSuvAOllVCR8E_04ri8ibzn5f3vMVOfEDh64TSCZNFGcO3ikdFW7LsHyJbFTVpK
 mLlCAz0G.r1VKzQYmKsYmD7A_50oJN6G_ZGMY6_ZOnxSnxd4USX.GLJB7AZkq.o6ge29_wMKUcuD
 w1RB_YYoXB87B_md4Osr6JeBXIIOtuCs52zt7AXHsIMz2ViQ6AT7_F65.O2jvyDkTTdGkSVxJ0Sg
 xhowB4Yrp_S8luGIJWHTwkkgitcrcSo538B4KJmjGxKwAzQ1Vb.9KRISzazR2LuEcKowGO09QkdE
 l7KV2lSSDsyCjHlmPOs1pdWEKpJ0o2C6mRkJlmC9cODpMGD.oOGJu0Mz_3ZtSVVwzfIoLZj1jKPb
 tIYvcdF4sbp77sa5tuzDgNPZdNEBHP2xZibkvFyno8J3LOldHJfMOAN2rnw4tw.oM5gzn2prEmtS
 Q0DNanLflOC8Pplt7Rkc3QENbyD8.1JyrIgl1LSb1vph1l1tFw2ZZ48YRDoJ19z5s94pSyMD2OMa
 8kiaNEROufLft31g7MA--
X-Sonic-MF: <davidglanzman@yahoo.com>
X-Sonic-ID: 53ecbb96-2074-46b9-a377-483ea8f34b68
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ne1.yahoo.com with HTTP; Wed, 18 Sep 2024 23:19:28 +0000
Received: by hermes--production-bf1-774ddfff8-xth2h (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 15399f6ce90a55c23687f37dc76a3825;
          Wed, 18 Sep 2024 23:19:25 +0000 (UTC)
In-Reply-To: <229243264.8919425.1726551100908@mail.yahoo.com>
References: <229243264.8919425.1726551100908@mail.yahoo.com>
From: David Lawrence Glanzman <davidglanzman@yahoo.com>
Date: Tue, 17 Sep 2024 00:44:08 -0400
Subject: [PATCH] ASoC: amd: yc: Add quirk for HP Dragonfly pro one
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org
Message-ID: <1249c09bd6bf696b59d087a4f546ae397828656c.camel@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Resent-From: David Lawrence Glanzman <davidglanzman@yahoo.com>
Resent-To: broonie@kernel.org
Resent-Cc: linux-sound@vger.kernel.org
Resent-Date: Wed, 18 Sep 2024 19:19:24 -0400
X-Mailer: WebService/1.1.22645 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Adds a quirk entry to enable the mic on HP Dragonfly pro one laptop

Signed-off-by: David Lawrence Glanzman <davidglanzman@yahoo.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 06349bf0b658..ace6328e91e3 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -444,6 +444,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8A3E"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8A7F"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.43.0
