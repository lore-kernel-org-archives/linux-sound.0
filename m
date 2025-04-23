Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93C9101F2
	for <linux-sound@vger.kernel.org>; Wed, 23 Apr 2025 16:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745427042; cv=none; b=sIJMDOF+qKjf3ufwXGF5cSlOqaTI2SlAKYbDPJ4ig3/u1irKS9MNoL+s4jUGFbz7KKc1udKqWSl5d3vvDmuProcxUvn+x7uFbTrer23GJCSCpzTUa95WKKIu+QSTmxg8kP20ujLaEp/MrQW8PzaKUaG75waUzKmbeTb8VP33q1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745427042; c=relaxed/simple;
	bh=HsMZWFYrTlUpfltEEjdQQtndO2n500+cj/V9sVjmRw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EG3weNyScJHzh599fIT5sCZ5Dl0LbCGtxVPdM/zpbIjl7ZqtZMu0yOSpyq/qh6AGUd0/TcUxFoYxqwdumxMXFk4XGfkgDRq2f8HVZCDLCi3s9pdadm1EmI35f8OCBPNs8TgfyiN2no1615k7fLco4scw+jh4lt8v4CS4k0B2Hfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4769f3e19a9so541151cf.0
        for <linux-sound@vger.kernel.org>; Wed, 23 Apr 2025 09:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745427040; x=1746031840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kT4xkXU3hJWuhsaijF7XFz7GWYoZ+LDhmBYoQDJQIuw=;
        b=cEdq+CzdzLuxgKLx0+pWLo6QYiaRzPh6Qk0pP6c4+ijZYE1tLKcylpxpMF978e7P8o
         LedrU4OkD80Z2s/j49dqziFFhdM1FHrjlE3B30mm/kHm94yCL3AlarXY7pgsDj3ruW5n
         t1e69YzubqjJM0WijqtY7VxRarnioH8lLtYLuAJmbWQ8HcfAMbI3T79G6EqbMhqStjXG
         wxMDHS+YLeuvmGBM0v8t2oflnodANaxU+Qxr/Jq5zrxAHIY2RLoz3XByCMrxkE9Peyb1
         pDWSakTMM5qPs+YzGggLhi6zI6UZyTYUmXbtFhx/YgnTgSoFYbAwICIQJ/LPw8HEG4Fa
         ICkQ==
X-Gm-Message-State: AOJu0Yz+eNTJ8Vhj8Qvl4JIg8oMqB8Kh4ocD8FNCb/QG/lqKiCU/l0vL
	EdSOAJYDuXgIhjyfdvtZFAxpUQQlv8i9xhE8jMDJb9TZEDVb7u6UPcx7Jyv3Akk=
X-Gm-Gg: ASbGnctmsXmNlHiWxcbexwGHZZRADIkTB/YEUOB528lcQhZPiJXYfwWNCYhcPRRd3vw
	Vt1xJGi8w6nPrEQx1TnNTmK3synT6R4eUFBQllqXneY4is6rHWBzFSQYiW+pMbmsz6knUBu3d7M
	XpvRyawWeRiWUNrtGwYd1phEJ2DKA41/MWUXm5x4Cyb49e+sPCoc+DSCwE4O2+qqIE8xPDiEkbd
	ICgr6UmOy/Be9I4sv7Ds7b1jq+MHCaodp0wClWbb97aQm77V4XN9hI5Jq3krdBlr0lWIw6S7NdI
	my8/lgbbLm2NjbLzjjvgMSbNLtIOfnKnBR7hcaPOgPEigRADFxpozinEMZHv6smcl+I=
X-Google-Smtp-Source: AGHT+IFA6pIGH1lFOtt/lGdE7QuG6nLIkdlujIimQLQaWrdSRbD0qC21blRpMccjQE4TnUJyjgX50w==
X-Received: by 2002:a05:6214:d83:b0:6e8:9e9c:d212 with SMTP id 6a1803df08f44-6f2c43a56e2mr350721696d6.0.1745427039552;
        Wed, 23 Apr 2025 09:50:39 -0700 (PDT)
Received: from tachyon.tail92c87.ts.net ([192.159.180.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b31d2csm72888246d6.55.2025.04.23.09.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:50:39 -0700 (PDT)
From: Tavian Barnes <tavianator@tavianator.com>
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	yung-chuan.liao@linux.intel.com,
	Tavian Barnes <tavianator@tavianator.com>
Subject: [PATCH v2] ASoC: SOF: Intel: hda: Fix UAF when reloading module
Date: Wed, 23 Apr 2025 12:50:22 -0400
Message-ID: <5aaee9fdfe8437ef2566b200bea45e4baaba3fcb.1745426811.git.tavianator@tavianator.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423150742.3095786-1-tavianator@tavianator.com>
References: <20250423150742.3095786-1-tavianator@tavianator.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hda_generic_machine_select() appends -idisp to the tplg filename by
allocating a new string with devm_kasprintf(), then stores the string
right back into the global variable snd_soc_acpi_intel_hda_machines.
When the module is unloaded, this memory is freed, resulting in a global
variable pointing to freed memory.  Reloading the modules then triggers
a use-after-free:

BUG: KFENCE: use-after-free read in string+0x48/0xe0

Use-after-free read at 0x00000000967e0109 (in kfence-#99):
 string+0x48/0xe0
 vsnprintf+0x329/0x6e0
 devm_kvasprintf+0x54/0xb0
 devm_kasprintf+0x58/0x80
 hda_machine_select.cold+0x198/0x17a2 [snd_sof_intel_hda_generic]
 sof_probe_work+0x7f/0x600 [snd_sof]
 process_one_work+0x17b/0x330
 worker_thread+0x2ce/0x3f0
 kthread+0xcf/0x100
 ret_from_fork+0x31/0x50
 ret_from_fork_asm+0x1a/0x30

kfence-#99: 0x00000000198a940f-0x00000000ace47d9d, size=64, cache=kmalloc-64

allocated by task 333 on cpu 8 at 17.798069s (130.453553s ago):
 devm_kmalloc+0x52/0x120
 devm_kvasprintf+0x66/0xb0
 devm_kasprintf+0x58/0x80
 hda_machine_select.cold+0x198/0x17a2 [snd_sof_intel_hda_generic]
 sof_probe_work+0x7f/0x600 [snd_sof]
 process_one_work+0x17b/0x330
 worker_thread+0x2ce/0x3f0
 kthread+0xcf/0x100
 ret_from_fork+0x31/0x50
 ret_from_fork_asm+0x1a/0x30

freed by task 1543 on cpu 4 at 141.586686s (6.665010s ago):
 release_nodes+0x43/0xb0
 devres_release_all+0x90/0xf0
 device_unbind_cleanup+0xe/0x70
 device_release_driver_internal+0x1c1/0x200
 driver_detach+0x48/0x90
 bus_remove_driver+0x6d/0xf0
 pci_unregister_driver+0x42/0xb0
 __do_sys_delete_module+0x1d1/0x310
 do_syscall_64+0x82/0x190
 entry_SYSCALL_64_after_hwframe+0x76/0x7e

Fix it by saving the filename in pdata->tplg_filename instead, just like
every other code path that appends to the tplg filename.

Fixes: 5458411d7594 ("ASoC: SOF: Intel: hda: refactoring topology name fixup for HDA mach")
Signed-off-by: Tavian Barnes <tavianator@tavianator.com>
---
v2: Fix typo

 sound/soc/sof/intel/hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b34e5fdf10f1..1767977e7cff 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1069,7 +1069,7 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 				if (!tplg_filename)
 					return;
 
-				hda_mach->sof_tplg_filename = tplg_filename;
+				pdata->tplg_filename = tplg_filename;
 			}
 
 			if (codec_num == 2 ||
-- 
2.49.0

