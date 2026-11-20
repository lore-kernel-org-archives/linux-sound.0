Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185590;
	b=dnA6MBFm7f8oebLHmRJhfqpjzq4MLNjUMKOPYVekgTO+3rcpjpXbTdbTQc2Ui9fR4pva
	 zczWkKPmOG/lqrJcYvfyLbAdwN9XcxnB3/CLqDxiwyz81l4zpuyuqluMvcl4pk2AgAMBi
	 H2PaqYDPqsG+ujYIhtG64M9ljYsH+U1tiDgXI8JSwZDa5w4AdvpFVzFFTjqquTaODFyXw
	 baRbwNN5qpRdS6iKubqN3LJQx+u84mSceCuqq8D31ccPfHh+bYVeuJkzxL1XwWBnu776b
	 565mYQLdViMAGcAQdDobdgsCWv7IQeSEiJczTeuEhaA8SovTgf6PqXC1EYZOxxXKxdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9HiUJ2tgMugCyQzI5P32t5LJYJ21TS1Yboz3dnwK9C4=;
	b=Cg+K675VYrUFd3QTo2lERQTbt+r+vljlfLAMCYvDkNvb4NmoYuxxAGgVKdkOQjOj8xlC
	 45qtf0O0pF4sobOhz1/dZHyn6bDLx+/MO3kUePZ5B/YrH8NDFwzBvDkLwUk+74c8SulUX
	 hJ0DwSUhfAcuIgVJT+HLbPDgTXNfPtW7J00hG+bHOJ9kJvVGmtcopr89dlOdt51W+v4if
	 g4RLI3hIo7QImwtYEUOuenlxN20UsoUmun1+B/8blD8e81uCEaSXABtk8o7minJfMsosk
	 0c5bylNB2Pxo7D9Q+6Z5m0O282PnhE666/8Z9ED1sP0jkMHMMLQL5PQ5mRi0xiZ6zwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SApNAdvy;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBA3606A338
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 14:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACBA3606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SApNAdvy
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso428486a12.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 06:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795185588; x=1795790388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9HiUJ2tgMugCyQzI5P32t5LJYJ21TS1Yboz3dnwK9C4=;
        b=SApNAdvy/CSds9YAkz1YuSic+xqkFnKjbI+/kXJNDLRHkTHu3iCx/G0d6IzbluKETW
         mcfZU9BGuYJTGCqdKdGrUMZhbWpIMJpMLitixA4UPVYg94J7xUtaPM0w6T6l3JR1bAbH
         Gh/uaMv25hcjIDKyoPuOVZoqBOyL2qhWmiODX2MzSUo9DNTn3u8Q8PznEl9OX7esIZgw
         j3ETKyYb30NW9ZaNy+lO38djlFneetEioZyiriaX9R+ElaioBBjbKVt+uPyN2QgG58Wf
         KlBwlP4SXT/59xUxgEuzaWN9NOx1CnqDcdEgeXLF7nfGAAciw5GlVGYlsG+RaMELzgc+
         rZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185588; x=1795790388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9HiUJ2tgMugCyQzI5P32t5LJYJ21TS1Yboz3dnwK9C4=;
        b=z0SwxIQpY3TbvP33AKdwNqW6Fv5RZNZDbq8AzkqOfyKjqCHQNCF+SI2kB7QzO2KmKT
         udZfkMhrEXJQQn8lx+lwFyOdNlqdbQqdwAjUxVEcU5q1KWVk8VFD+gVSzCDBRrtb92yh
         bCx5RA/ECLdVln/CiYkUuGDnGmjbMNLpfaP9VCyEMnP+ZM4c1WbC94VHL5htt32NWWCt
         qFzDCX5lKcQVzYyyBtTFf+fOQ5o8TmRmvQypifS1L2nVvE90ICIiUghBJBHR6OCTbeEA
         30hf/1ZCT7J9Ex5mSAmIF2cR5aOG7IszpAHWDodZAPFagj1OGsd2x1nZRwRYg9VoL45b
         q/nQ==
X-Gm-Message-State: APuU4Z/vYe0U66ZjQ7K2qNqXt3aqbUu6Jt7TpOw/jh6xRL+TRiWf3xCf
	Dh2PiCfd4xoq2WWdeHb7954R0vw8sZi1+SWjt0sxnV9wp4/9yGdytZMYw2I5FReM1JE=
X-Gm-Gg: AYBFou3gdd4qXDZBYVnb4oGkOQ4XfrYQaHBRwWsArZcIbd22k5oM83bhgCWpoVPqpzd
	4htCeoE2OrVjuk0FrUExffGYbaI9UQKwLMqu4PoGGxRGWQ51VdJTMOl4ykjb+9jCy03kcryxe6Z
	bbiaUuugnxd3b8abln8scq+TmQ6+/+R2x/9cIqlqrBGRkp56ghAe2SVcISAaPibn8naqMP0dsd1
	u7AcWPDj6ZblIdp8q/fRy5243FNDYdx1L2NtXhhq2kI33Nd+OgQZyA/K2Rus2xjrGn+PSttNdQv
	gXNA0sx8IKYbh906fehm+9aQxqXySpKFR5E+K3xUgKxiafg+ouqn2Rmtvs9WA8SlcJ9eLc/P/SI
	HNSjRE+J7Gc7aRkyZyLRJy5QiLjq+3L/xvx/NaQtb4reaXIQ6luWE5v85UQ9IkhrUb+3ISsYs/x
	1dgtWDiJ/LpOQRPMOjaYzHqrmUU8YVw/2K+GkLEmH9/5JeFP95KgV/L9SM/ISJXYEgIlAeBJf52
	zlcJ6VIMAUE4F1EIoxdhJmunTaBKpd9Peyk7t+FSoEftrPSrn7GJMDCUaERYXGmEaQrONZVsZb7
	nSJ4znCD+95eCy//An/nraz4
X-Received: by 2002:a05:6a21:32a2:b0:3f8:9a14:4724 with SMTP id adf61e73a8af0-4014d456c69mr3318620637.30.1795185587573;
        Fri, 20 Nov 2026 06:39:47 -0800 (PST)
Received: from myarch ([121.165.40.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4aca2sm1577048b3a.32.2026.11.20.06.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:39:47 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: broonie@kernel.org,
	Vijendar.Mukunda@amd.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stopthewar24@gmail.com,
	JaeHoon Kim <jaehoon1744@dankook.ac.kr>
Subject: [PATCH] ASoC: amd: acp: Add ACP70 ACPI flag override for LG gram 15Z95U
Date: Fri, 20 Nov 2026 23:39:30 +0900
Message-ID: <20261120143930.9662-1-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: JaeHoon Kim <jaehoon1744@dankook.ac.kr>

The LG gram 15 (15Z95U, AMD Ryzen AI 400 series, ACP 7.2) has the same
audio design as the 16Z95U: RT713 on SoundWire link 0 and RT1320 on
link 1, while the BIOS sets "acp-audio-config-flag" to 0x10
(FLAG_AMD_LEGACY_ONLY_DMIC). As on the 16Z95U, the flag makes
snd_pci_ps bail out and no sound card is created.

Add the machine to acp70_acpi_flag_override_table. The rt713 + rt1320
machine entries added for the 16Z95U then match.

Tested by the reporter on an LG gram 15Z95U-H.AU87U1 with v7.4-rc3:
internal speakers (correct left/right, no distortion up to full
volume), internal microphones and the headset jack work, also after
suspend/resume.

Reported-by: Andy Pearson <stopthewar24@gmail.com>
Closes: https://github.com/CachyOS/distribution/issues/516
Tested-by: Andy Pearson <stopthewar24@gmail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: JaeHoon Kim <jaehoon1744@dankook.ac.kr>
---
 sound/soc/amd/acp-config.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index febf559..6104634 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -140,6 +140,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 14S DS14265"),
 		},
 	},
+	{
+		/* LG gram 15 15Z95U (ACP 7.2) */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "15Z95U"),
+		},
+	},
 	{
 		/* LG gram 16 16Z95U (ACP 7.2) */
 		.matches = {
-- 
2.43.0

