Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9E179D1
	for <linux-sound@vger.kernel.org>; Sun, 17 Mar 2024 02:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710641094; cv=none; b=JhKms1rYToES7Ca18IQA1G3shSvmCzrarhrEmVmjoRK7hppuVtcI+4O4r3jV2jqtPUpmsVlUImDad36V+Q4DxI/6bKjY16chiNlwaOccXcqzTeaaf2YbmJs8Pc7+0Qq8wMhqXUXdPyRUDeMzu+pbjkF51U59DB16ViZeDw9hlD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710641094; c=relaxed/simple;
	bh=aCT0vUa9iGG4jg2bvIm4ZCdWt/b43G+VBuROresZ9VA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=IeEkLqm0nUhNqiDfswqwyhjqhueFwgxIvTkhsPAaHcCSSLBgpDfTlkwxiRV81e8GMslOowYWhbNcWILJJqkC06LxTUOR0Vw3rSxhj8x+554ZHPP1gMe1mkjP/jNGr4JEUyqjEKUNwWuo1x/Na+DrHnEf4pESCQ4Vtr35gmo7vI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cpp.in; spf=none smtp.mailfrom=cpp.in; dkim=pass (2048-bit key) header.d=cpp-in.20230601.gappssmtp.com header.i=@cpp-in.20230601.gappssmtp.com header.b=m4W0rfQY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cpp.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cpp.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cpp-in.20230601.gappssmtp.com header.i=@cpp-in.20230601.gappssmtp.com header.b="m4W0rfQY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1def89f0cfdso10617705ad.0
        for <linux-sound@vger.kernel.org>; Sat, 16 Mar 2024 19:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cpp-in.20230601.gappssmtp.com; s=20230601; t=1710641090; x=1711245890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWtXa4epYbJQbXxdWpC2jiOsOGSFUbjYRhlCuBfpHew=;
        b=m4W0rfQY9orveLLiPnFycdorxiTPY/5TLey1SEPo68ocpSSIasMVoFfbq5qT9DZH3L
         pISO1ebjO/rvPF/z7MU+riD3+2qdbfsoZNZ612ttCcZl09zlK/d14ZIQIyySBFNr5dkt
         ipjpidONNzKO8xw39jG0Vh2pjxttuIFkhSKJmUT3annGg+otQEnZNyuP9Pzeur32V0Fw
         ptQj3DcbNWnkefdzfb+5AavE4z63l2CaBhHs8dWTKSHMBRoMO796tiuCm7lagVhxt81V
         GIX8ips2rZiJ7ZOarBPCfjFp9MJgeYVbBx5L6AAw3SlIZ8tQymi8N7AtegS061PFHBxz
         vDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710641090; x=1711245890;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IWtXa4epYbJQbXxdWpC2jiOsOGSFUbjYRhlCuBfpHew=;
        b=eLn78YwPuU0sf+86MCIzmzbf3mNtqs0nF4uYL/OTPFZXHOQTGS8ShGgfAHBnldN5te
         pxqWURzqWcwecdHQ8tEk+3qz+hGLZ8e8fy52l8imaR/K7rvIzXRKkTcYtZ0vzUAU7cAQ
         SA5XB0X/m7TwalinqT44vddDIaSXLZJtWfJlkQnh+KxlnZAPZrEh5TR8t/BQC8hVgPrr
         Kxf2bzv6TS8WJM2dXZyHS28lBKQAG4VUHMUbDYfvWzAii8R8gjeJ5vsZJ3laU0abiXHL
         oYTtMUsCUhI7xjPOyPW2Sg5QkXYRpZ78RpQ42rXcdbrPsyqRRaJ6WrUfs5K58EnAcxv+
         SzfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUQr9LZFInoki1FSuw2Xmgx2/WZoB9dxFOHsRm2Q9D5tCv4iDl+pVRR4zpbWiLzvno/r1a9Ur6MU05fBr8cWS0hx1WckPffFBei0U=
X-Gm-Message-State: AOJu0Yyf427ZsCuZKRB2NpibLh2Qk6NZoIGXx1rD97z5GrRvaqFab5Lv
	vUeFFfnCjw8RSKaBFP0gVwLw+spww82VXfTAj3PY4G6PmascowzbOKZT+AYvmQ==
X-Google-Smtp-Source: AGHT+IGJfXs2YCoHgkgwujxBkyiSGmRp8KbhcbDvqGktBTuf7mgurovld+JrdIomojDkTkRDlF31Vw==
X-Received: by 2002:a17:902:da8d:b0:1e0:16e0:b28e with SMTP id j13-20020a170902da8d00b001e016e0b28emr210988plx.34.1710641090085;
        Sat, 16 Mar 2024 19:04:50 -0700 (PDT)
Received: from [192.168.3.16] (mx-ll-183.89.30-58.dynamic.3bb.co.th. [183.89.30.58])
        by smtp.gmail.com with ESMTPSA id v11-20020a170902d68b00b001defd3e64d5sm2881143ply.263.2024.03.16.19.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Mar 2024 19:04:49 -0700 (PDT)
Message-ID: <570989e3-299f-4617-adde-b6b8d1e06277@cpp.in>
Date: Sun, 17 Mar 2024 05:04:44 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anthony I Gilea <i@cpp.in>
Subject: [PATCH] ALSA: hda: cs35l41: Support HP Spectre x360 14 eu0000
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The new HP Spectre x360 has _DSD for CS35L41 amps in ACPI but
reset-gpios and spk-id-gpios are merged into single Package of size 4 so
_DSD parser fails to parse it.

Overwrite broken _DSD with the correct configuration.

Signed-off-by: Anthony I Gilea <i@cpp.in>
---
  sound/pci/hda/cs35l41_hda_property.c | 2 ++
  1 file changed, 2 insertions(+)

diff --ruNp a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c

--- a/sound/pci/hda/cs35l41_hda_property.c	2024-03-10 23:38:09.000000000 +0300
+++ b/sound/pci/hda/cs35l41_hda_property.c	2024-03-14 18:22:01.887566917 +0300
@@ -64,6 +64,7 @@ static const struct cs35l41_config cs35l
  	{ "103C8BE5", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
  	{ "103C8BE6", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
  	{ "103C8B3A", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8C15", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
  	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
  	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
  	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
@@ -405,6 +406,7 @@ static const struct cs35l41_prop_model c
  	{ "CSC3551", "103C8BE5", generic_dsd_config },
  	{ "CSC3551", "103C8BE6", generic_dsd_config },
  	{ "CSC3551", "103C8B3A", generic_dsd_config },
+	{ "CSC3551", "103C8C15", generic_dsd_config },
  	{ "CSC3551", "104312AF", generic_dsd_config },
  	{ "CSC3551", "10431433", generic_dsd_config },
  	{ "CSC3551", "10431463", generic_dsd_config },
