Received: from sonic304-46.consmr.mail.sg3.yahoo.com (sonic304-46.consmr.mail.sg3.yahoo.com [106.10.242.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E3624EA90
	for <linux-sound@vger.kernel.org>; Sun,  6 Sep 2026 07:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.242.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788680589; cv=none; b=F/sCpCkfy3oy7cwTZJaCqgIqKnIBJZ+iv+ojT+F3CT+wqOnQoJ50ooIOjqV2wjnHxtUoI+c0D9Kj4h7Rj5s3GnScLmMrN3Y4MlzljXaMvnoKf0VqrrQfOuTA1XfhQVUgRVzyt4svKriJb22RjiW+ybweeoGMLROOJojctvthIws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788680589; c=relaxed/simple;
	bh=0fZThvsJiB1SVp88p7xvj4Q2ng8o/do0QgwFtcYm9AY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:References; b=AiyWWc4D2SBasZ5/to9fgoKzoBB7aZIC3C8rxG9VDBMDhxQY3axtn1Nm3SVZMJGLeWFZBqPUdZXZwUVJeXy2sk8zxfJMDubp/us6U6H8LnZjxXHZ+5+K99QdMeTdp8+xIjK3BmDsskUw1OwJ8kBZlLyyT++4X5B3ABs23lM2N58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=QqPyZ4Cf; arc=none smtp.client-ip=106.10.242.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="QqPyZ4Cf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1788680584; bh=l9zWHxulmZx2cLXTPCewxnXcoi+pUT1U77rBAQVom2w=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=QqPyZ4Cf0HS7N9FR3dJgNaD0w+dHZWo0JDUiSMM2iF3oRdQfGbBWSrhupNqLXc5681zo7k53DUZAfubJgYUS8x3Mp2JZjYrqW61f7ubENvULSJRMbNem2fa/Ig31c0IlJJR7kn3cfN0VPj92HZql/3+aw7/4OTbbj5sOiEyt2U1xFcnmRzOzRc1mC0rKWBPWDZX7+5EGUzLHDIoViJ8SulO9/fmmasM/St2cyKvhuLeAHA1nBcHFOHzTOnt41mlszCEgCV+XEdOd1G6bPqsJF230zGKiMcXzVsQVWEcVQF6iuZck3wx02gfVW2/cc/TyH5WDEfW9ZVixZRdGVkaEYQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1788680584; bh=rqVv5WF8th+u4xPaGuTaVcnAGKq8mntEGUvq929zTxR=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=DNc8W4GFVovchTlp+xWz5naXeM9CTaGUmJi07Efkh0CibvbBAq7P7h5RtdSVh4KTtErnD4QrPXPgRbht6Lyq3T6wRq7lnV2uB2f8LcN5kUJ2MmfyXwzPFFPSVdLv95dXhlhbvC2bDa0Ow7rz3XiJ+y7Z1cwUnu6dgVeJ0pPtzUHlU4SjHLkTdXEnksyotrzSCTxBuTBiX2smu3JlURSMd5ru/fiZuH9NNsNSbKiwONZ9kwlD8/W5EKTYbJa0wKo4sZfxSrqsumZ3lJUhNv9lXmdPJ+qoLyo4g2hWxrJ3m90RH8lBIVfa4uWpWY/WNvC4r0fwEVHww9siPl7IcHBKtg==
X-YMail-OSG: mA.nyxQVM1lBE5sEC5ACsLpO2NOAs8RmCUT0m7NJ3SXVkZLNJMBSsFe6KotsSre
 2HTJA7RGmJZNW8eUOHztsmnloI2fXjz0uNGMoGZE9LXf1FNjc_gmPZtebPg8jh2YCmYo6CQMlLvy
 75NzLSEai.9BV.DA3mBhRDIvlt.Zr1G7S5n73Kt_vICd3CFYXZMdoyjAH.xFvsjy2734RSNDpvgS
 wlqQ6bFWTWtGmb13NiU3vVmn6IUFO5p2KJklvuXRljr8NR0IygwLvvCS8IEI0yUBkA2HtB1QRL47
 dfu30mB5IuoglyNOvRF6I59fMtusqGonFECvcbA8KG1fUEHAoWmBdJS9k6q.p5ABMk.eIuyQP2aZ
 w2MB__DMo8DLgrhY2RomgID7yqiik2HNT8RzYnfrTl9gIR_nt1HfyxvsnV6dKlGMlPZ.ApLUBveC
 bkkysr.roHq7cZtvebKOd2A31TBiyCuCZgyCvMHcwbwksf1FpRRt6DOXHrTMFFz0zHfoWHmmAISn
 scXzvIuosL_FiDVSs5Jiv_ZisBtEyRqK1Ie4Z0yBGDLlDlxWuXDg9lOxwWDsHJRr_SKomZpC0HzF
 OQXHwvNPXN6IGcdARYZOc_yt7ITs1VDcIjx2Nm9Nob.877.F.yq59jLR.vp1ha79sDPREJAb4p_R
 dk0SNn0C7XyGjl8nFYlG484TgYz_91nOi3fMrESucNHdv_4ef2P9BrGHMZhf74SZ2CX..TRnTuej
 sM_SrH2Ro83b.l_yCSjefLnZloPa1dWQUPH7JDBxX9wB_PMOHRRlyFNMHa88Sr.GYR6AS.GrVZPh
 YUAZYLU7QNdAaUAizK.fTgUj0s1DKL6u4jG98w60ZPA31YFa2HYrVdy_v.9hCDm0UWcN_sYnDTG8
 junPHsv6DZewBDLGTkhq1H6yO2LFVUjUl01oOBJT_VgZBtdmPQhvWXeB9e53CC_7hGCwqQwM0LJg
 9XHB61hEP6g8MVCmoxZwaRIaKLsyMUU5UKgt7tBjZeBIg7gv01D5bRsyyk721RFoYcLvt9pzR6AY
 U92X2RSrZYSVqkjqYTfKa8mN70r2ZnQWl_bkhygFWyqNfAVnAe5qsTIGb6WnuDBQAUctQqCOrK2W
 sOPlmTP4i4hO2sdlMTZOd4VO3Z4xvCNvkxWlm9O3XyZOTlYZvXw..UFaOI60aoZ3M6NZE84Vtp9N
 z85HMuve4ScpuWngtDdrPZfgsSKrb_taIcV4DUCPN36Z7hAURONsshehaBdJdE.TWTdNaOHeX4Ep
 nJU4M3iUUhc3acuRJnQcyj76K7uAg1T40U9_zQeNW79Ukp8nP2A8g4MviXcI74RNKVEjeJImWAES
 rlU1CXhDrlWjLiWS45mFIiA3GbiRBZ3loL.yTHyRpj.2G6xyJOhhfXoD5seJopoB.MNK9FcTjPei
 D0cLC5SIBRFWpMq.cdrcf3nHUdxVV2lYGYeUIFJF8SlX4PkmeAZzC89mfgaphgMXyUcssqs8F_2y
 8EzEv.lbQm7xIJ.zG8bXsYYn_WeerLrGUToaUmtmRLgSQ4JBMX3olkl3iomT_Jhwm9G5saEYa_rr
 yrsbfY.gGjLM9Aob4h79lOF91PcwnX.SQb0ILllWl2Vl0cPnTrnAFy0VyuCL06STlmbpg7GaRuLO
 B19gbb50S7fYfr7rrkqhNu99mGUcBvRSkgK15cH6tvvcyxUsrVGoGZ0An9RbcFH9e4ttm_LPDtmM
 ctvR.5vJPqay7Ykp6LgF3NyeBc2FLANZfL5qXI4hiwtrQ5KirvWYnZ9JvHZjiH_N7di3hVjOJ75v
 OMj7EaZ7irXp9LRHo6ngU1FiEE0HcfsQgpWiMs8GD9faCr9vRlMPt2BbvhBEZTOY4hi1ssrmok5X
 zjrW0hseJyYkCYXY_HHPG8.bW11ml3ptgSJnuAehXMYcd6zDaifmQKykPox4rlB76AKEWl8FCuiF
 0Fpoxbrd0fUSkGzuRzoRFLeqdGTZsxtow9Ho3Nw0woWWiiXfbFPesvPbc9I9Pr4Er7s2qFLf7BFD
 J3oLb4mHIEX65I7EyfQFQgm2q4e4qP3hCUCdHSiqNjqQVk_fChnUBXKk6oXQGWj4_.gr0Sr5nJ.s
 34xTteo6JFfjtxN4_QCO6C6IxrxDf8nqXvTAz9LqCE_8ooIiRSKKVUBQEVmuU0cSJfJBflgQyZJ.
 .bFMowCGHBEAy_7jwO7vwT0xZO3v27XMMwVHWOy6lPfDygdHVbHwYCi3qzu.YotYSersM3T8y5BA
 eYprNgJneJZtw0Jd9C5nVflTckHOw91V16IBHJw--
X-Sonic-MF: <mafiatamilan@yahoo.com>
X-Sonic-ID: cd298061-56d0-4ae7-9e77-8e3d8b9010fd
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.sg3.yahoo.com with HTTP; Sun, 6 Sep 2026 07:43:04 +0000
Received: by hermes--production-sg3-664647588b-52h4b (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID b18fd0aebb47f8ebafacf0df8444bc70;
          Sun, 06 Sep 2026 07:09:41 +0000 (UTC)
From: David <mafiatamilan@yahoo.com>
To: Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, David <mafiatamilan@yahoo.com>
Subject: [PATCH] ASoC: amd: yc: Fix internal mic for HP board 8C30
Date: Sun, 06 Sep 2026 12:39:39 +0530
Message-ID: <178867857905.85694.5014721659216165123@yahoo.com>
X-Mailer: git-send-email 2.45.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
References: <178867857905.85694.5014721659216165123.ref@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The HP laptop with AMD Ryzen 5 7535HS and ACP 6.x coprocessor (PCI ID
1022:15e2, subsystem 103c:8c30) requires an entry in yc_acp_quirk_table[]
to enable the internal digital microphone (DMIC).

Without this quirk, acp6x_probe() returns -ENODEV and the internal
microphone remains undetected.

Add a DMI quirk matching vendor "HP" and board name "8C30" to enable
ACP DMIC support.

Signed-off-by: David <mafiatamilan@yahoo.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 73baa48..0d3304d 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -721,6 +721,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 		.driver_data = &acp6x_card,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8C30"),
+		}
+	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
 			DMI_MATCH(DMI_BOARD_NAME, "8EE4"),
 		}
 	},
-- 
2.45.0

