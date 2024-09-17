Received: from sonic313-56.consmr.mail.ne1.yahoo.com (sonic313-56.consmr.mail.ne1.yahoo.com [66.163.185.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD184176259
	for <linux-sound@vger.kernel.org>; Wed, 18 Sep 2024 23:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.185.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726700710; cv=none; b=TpJCOMcfkPNnU8keWo8UBsegrBvB3ogb3PsF5SB74kmfdJUKhdOqR77hJyBHtBdZ4c6/O+N7HqrVP3AXwhz1YIqcFqEfOF/5ClhQk3Qnco1hV/9c4KvCXmgC6oIve6LQJ1OSlXJN8dtUI7gbdb83Xkp6UjwemilZMBawXvgGrfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726700710; c=relaxed/simple;
	bh=jBvjiVJoVl3rayUOpCUuDtc63dyAwl2vmEGUv30trLo=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:Message-ID:
	 MIME-Version; b=pr3xf1xSTSnRW/L6FK9FiGL2IOOt/BkLbPl+6vNvXdBJm0eYwoRQMP2vBJJqjPjD31tZsZ3w+U8muDWi9BRLV0t/cEqGHjaynp6Ls/Mdqh0XO02uFFmz0jmMS8k4Pcp+PDWiTQ7OwCZd6bs37fDQrQkD1qIzF0AH7mnbzYSIm6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=IpLdxgwM; arc=none smtp.client-ip=66.163.185.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="IpLdxgwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1726700702; bh=w9oz0JDhCk8nyqPRrbyfOr4o1i1aJh/C88iTJujUcZ4=; h=In-Reply-To:References:From:Date:Subject:To:Cc:Resent-From:Resent-To:Resent-Cc:Resent-Date:From:Subject:Reply-To; b=IpLdxgwMwKbr6DgI6/PRDN4sm6PtAGp5uWu/O3P+YGJMlHxbOudjUFV2vMsZKYQ5UB5P6ZpyLtiGSqK1TZahFJM++ih2/9k8/1KLSKtBtZ/rBb/l8aCx+A3lCI7e8u7aRe6fTsv1G4ENo1buGU7zc6T1ZPagLDzbWPBSE9Do2vcaSfVHcPF7Ox9oAr8R6MzOFD80FjGNWksM1qgfVc3qeUUgBh7g3ZBz4Hgl+dIzJpDYhLDOvKcO0uFXgQvz7TLVgvpTidL+vPkHMZmOqhJ1BzFqOAre3niaq6WldRWEdsgIggxLdxJ7S5j/3mkBidgFugiJHXoSSBGcQuhzY3QWEQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1726700702; bh=Xw3gzVruaqDJZP7r8deDSMDHiWEjZeLF/CmeUuMVwSq=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=C/N3i47kgVy4JJkYRATbGhtz39LhTXWVyEiT1M04TsZYbKSFnlroSrrghyjndJoMdWfwcEvsX0CnclQRrhyU5d4NwQGbiFDYFFpHMAOAOvrV6Znj+Qk362FVolCA17zs3dTC419gtHh+Vqb1JA73yPhzBSzEjUed0HR72dUwd/5hi2JDJbUOnCiRd9gKLv4UdxaLuxiuAMotX/jUSA4ESGunYwu5LmPvQsl5bZwkmbtmHVh2dL26PoIVrjA7chrKL6xjOPwSrMLpfZundKhCyLveK/Tog6PRJX4kMgSyRAoRew/GLVbDA9QKgEyNKoXxrKnD3WiyYbMlmkpQnZe9ig==
X-YMail-OSG: kmiwxrQVM1ngQK6V53BIjRIxKmF._cMsFnb0nbrBkdh0yjnrz5NZvQMdZK0YPiz
 YpeG1auR4ZrL7oxs1KYrzHPeR7eWI9sUxV.LaIJCoIXE19UdeUQc1cLSUAzSdHApppX2yTuBwdrO
 mpE3fa.c6xbpVurkkMamDvpxyObV_xq9YsV41isp2RkGp..rzyKjsZmpZgZIyTNyUSDCdVImVZMH
 _t31_eExSqiAK4upn.Pq1Q1hkqYc3RphBEqJagTfMUMZOoHniFDkzfY31zHDSWt95Xd7m6EYYLtE
 o5JW5JSrRFnrfQwE.OTJMF7YPXeV192IDm_xi63dkm5wP0N0PB_E50VlUlY9zCde.4d0NSjgg8al
 gMnZzj6iQ2AGOnWHWSoELuq4NC9ZOy4I42yjo7EyLPWzH.mLkVaj5.t9OPzUgWSQ4SrOanJyb7Re
 49y9.a_prXP2ec9v8podLw9PcXir_EqXg3OcW6.hvmzvDokLxKvtj0BEFZa54lIUon7MSsmQl3Hf
 u9nMguIcVef6MFsqSOLPkwU8QNleAXyyR928HbfYbzDTeGih245eDwu8zsKZ4fAvs8xOKYRylmkX
 yroulgu8wfZNsxYBKZV7wZMpwqt.glh_U0FIfUhmUi0HkpDuTGnJW4XLjf_0Ni0kOOMottzvKBDa
 djOrkxpdEyubqJOIyegQYcnA2.iGoqjUr0uMC7RpzgeFpQT93bC6hkrDj2bFeQxDTF3yqhcbuhPz
 TdE4mj4.Uh.V4Sg7tVZBN5BJW9YylqlLhA545T6LSghGD5y__bsZI7G_tGDzJRenRxF5SxCtlTD.
 J_.6UR3rSOSNBtFiH8h8vFPVcz0xacEuKbWVseF.Q0tkTliFzThFANMgkNIawtuMc9vafdwIT2w1
 pve9dF9TKOQhGt8MgBXB1jS_tqxVzuRWYU6zIHfsYtOIX7sScBbGhddt_MN5VpFE3xye32eA_4.P
 m949EIMgfJo4NstqMVo0A.udwbdrHdUGkocOzdiMjDOTWSSOn8ILh__Rk5DBd6_GMJSbd9xWuqQS
 en6ew0OVftVrCH5_MUPP3DBhZkhj3nwV20rTkgg_8nOln8rBv2G2aZIImBFGJJwY_uAJxsbBGGNd
 y7yR_N0ePz4yvrmJWnUN_vYidFzBJKYaojmLTE4GpPfoYOkQc9y1zk451UYHBcavZzquEfF04j1o
 6.dIPbTzwt_IyYHFSfVMH_yS9dOAJHO_DsN9dgV3wJFK5rGdef12vYwaKyO0zkdjtvP.PPwoN54G
 xWgUuHbiI7HvRSOj0pKeYM0tUvxdOwhW64KlcWTfEL0Fz.VP6DlFMJeKGbO8GYqd62DgYwens606
 GNr434NuV1x0v7S1SLmiz0JkGdelbjyr6XmdaYw_id7H9l_2IUf3DFJPXvwUSlRflrn8a90SXlDu
 UB6Rm5wi6UbgN0qEmR7cxzea_z26oQOqecnehwQxklVAmNEAWz.bxRCTKLgeKVeNGi7fBgHo4OM6
 aMJ23yzViHh7kt1nb9b8ilma4UKWOxiGahl5UmKO2kqu_.Ul.Z9IOGXNN5NAMLp5.TdMmYfI3koe
 btOq_rcE6hKqEmUdzSgoyq3bi8ihb5eEn5y3g5iAAmzk2IcaNHTqnWbz8gfY3EYHx2GQ7bRWtGvc
 J4E4451WVV51uJV7avzTZLtdhAo_bqYu3480nyKVIxlnByheVcisooIOT5nnRSRb8aTbhBkJM92q
 Ff8_OhW007tEj_0uy0poe8yEX7m1Si99AdoWy9QDOquFRLxDdx4FguwBwh37m7pJrJclUUrmJ8SB
 fJRxpIEtLsPvot0YYwzK4Ik9imjptYfe0WjoqoEL8puTnf32znyq_Hk5qQZ2hbCdQBhEE5CvWsGE
 XrXvN18jw4Lo_vwQsFVGBebhWQ04EBZjzD3goMCq0thvm5VfXzCL9DUa1oIA4.IR6um.NaIr8uDM
 N11jarVbL4Agi7dkwLEo0pbzKdHGCDGqMP8MV1zCiBeacR1KmFxhDiO9rw177Od8ZdxHcpvdKqJL
 hTjE5AeS1dk5KaeNQJdq6XV9MYMeCv_Y5hTFuvzisHLt8Ks4550zt4liVCsF1DesQzWZCdEMFgsI
 hRTlsRTHaeFUYuuDqtcRGcYafE360HM7Tdol3RSloaxLgGTqG_D3TlonsnUIOjGdIkwciD4gmabo
 1ZC5oxvbC4INMyXXCl.fNEBbfuCOdRb6wTJ.J65nJrhoY3uLURx2ebPfuMoBDCqPbK_67e1_bdVr
 9jpJPCcMAX1csJqGNgdx_Tg0sGptm_TjrN88uMhkvnnzrlSzteSE4qbvbKmlz_1vF2lTPpCYOZfe
 739a1ESA03sMG4StWww--
X-Sonic-MF: <davidglanzman@yahoo.com>
X-Sonic-ID: 81ec76bf-a237-46f3-b5a0-3183d15f9839
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ne1.yahoo.com with HTTP; Wed, 18 Sep 2024 23:05:02 +0000
Received: by hermes--production-bf1-774ddfff8-w4gmq (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c2b6155b2ec43aadf46b4783f134ec4e;
          Wed, 18 Sep 2024 23:04:56 +0000 (UTC)
In-Reply-To: <229243264.8919425.1726551100908@mail.yahoo.com>
References: <229243264.8919425.1726551100908@mail.yahoo.com>
From: David Lawrence Glanzman <davidglanzman@yahoo.com>
Date: Tue, 17 Sep 2024 00:44:08 -0400
Subject: [PATCH] ASoC: amd: yc: Add quirk for HP Dragonfly pro one
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org
Message-ID: <3f76bbebff9e4f94a90bb5789fd0ca2a67d839c6.camel@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Resent-From: David Lawrence Glanzman <davidglanzman@yahoo.com>
Resent-To: broonie@kernel.org
Resent-Cc: linux-sound@vger.kernel.org
Resent-Date: Wed, 18 Sep 2024 19:04:55 -0400
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
