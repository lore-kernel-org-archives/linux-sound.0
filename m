Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4242C263C9E
	for <linux-sound@vger.kernel.org>; Wed, 23 Apr 2025 15:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420888; cv=none; b=gcrZ2VzG18/WWw9IAswC7dinQ4Br2PJaIEBDeeZ24abScjm8HYO+XjZ4yOvvz/gg/3fnP3FBp78W+tyT1Fgg/5MnMoH/C74IoA4YAdOEj/QAj2BpdhHZHxSfbPZuXke/ITuEcxteVkcCrRfmpstoBMR1gFN86VoLQPBozfyIRAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420888; c=relaxed/simple;
	bh=qv1Hn14qMkbcOg9Vff17qJYfl3wxnNaqnknwcPBA1ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAWa3AecGZNxMucV6Aq8V9W76GuwwIHEOlnQ145b0PVZAqpIpDLdnLQugoLobi8aqC49upo5OtAENRBaY/BU1BeTM04+/S0hzJzIfu3XVe2TncyGsTQmJqemN+LeTNAJ1DfBWvrq97B58Jk0y+Kk14wH2pD5cgt2WqIFZJHC940=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5e39d1db2so352860385a.3
        for <linux-sound@vger.kernel.org>; Wed, 23 Apr 2025 08:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420884; x=1746025684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzOl8il67LwjmIyFC8x8jaKzOr2T93zX6t6wVre2M+s=;
        b=e4MNth0od2Oa0037dCD1a7iW9TxvOv+9Z3TRmNaxQTCJgrl2gnEX+kjLDYHqht4ZaW
         j1Mt5XnRUdPWbirSZu2or0WI2BoPg5zP5UzRtp7h/n9RdAYq81FevalNOaGbtd5ZpNgW
         qS2uKqGvU+SDvBcgK9pv7R807sH4XVLFeLtci4NbLW0cxFlOlOOG46exLqVPauRubeZH
         zsRO/52RmAgWwWyaxQyCfoy8TC6gGXhsQRLCBjQnrMCeK7hyNKNFhnmADflc6fXUNmoL
         nHT0ITxVgQLJe2tyrdwtTSUQCgAh5aN0n7FpNIkSGa3XnVZBJnEUfnT8puzm2BwyX/Xj
         J0uw==
X-Forwarded-Encrypted: i=1; AJvYcCXT4hhYmrkvkpG++uolDJttPCZnDHBEBbxBaJ7dKd4Eg2i46psBullRAac26GnzN/J1cU+atkZDLh5L2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKudR5wfrqkzTDyBQvTAjRydUuNODRlCK4lg8xVjlNj+ywwJoT
	CCj31TkJwh+YvFFYP4WTOgcjzbQ2izCxUmlJ8YJ+f7SDEPDcTfLWtkOwZODpU+E=
X-Gm-Gg: ASbGncutAgbQlzkQBQVDKhrNDnbfhiYSQN5lxlkj33vU+laQk5//Hce9Yre6v2xAyAi
	wTWlsWwKl7NN/iQxOuFNRL2+s4QjhOmXP0pryjXGQa60DaxDjFI9OwJsrs0JJ8qohtGVJXUFuSZ
	BrlWYxE/OMTnlYwfSvqeUBeJOnfFzmMwTEu2Y9JP3qE3Zso5LDTYoYc/6ZIM6CA8d8puOkQyTsZ
	r6FvFyJWB414cxEKq/JYPjAuEoeOOWSy8KWIL05x73BznZ104k3AMIelBTG53IGdD3qWBZ67ohi
	CnrNFXeRYtXU+fVKurazzhWiz45Z4pBsAYfzD28DOAnEQSwlyM7u3ZWmrJm/tU8CtuM=
X-Google-Smtp-Source: AGHT+IHV/xKD1EK74R9N7+8b5Lv0O4faG8ORm2pGLLN6BKXNCH+GvHXSkQY/L5KWUUfUnScSalWJ2w==
X-Received: by 2002:a05:620a:1915:b0:7c5:a5a2:eea3 with SMTP id af79cd13be357-7c927f9db7fmr2758933985a.34.1745420883909;
        Wed, 23 Apr 2025 08:08:03 -0700 (PDT)
Received: from tachyon.tail92c87.ts.net ([192.159.180.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b4eec4sm694518285a.71.2025.04.23.08.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 08:08:03 -0700 (PDT)
From: Tavian Barnes <tavianator@tavianator.com>
To: tiwai@suse.de
Cc: brent.lu@intel.com,
	linux-sound@vger.kernel.org,
	yung-chuan.liao@linux.intel.com,
	Tavian Barnes <tavianator@tavianator.com>
Subject: [PATCH] ASoC: SOF: Intel: hda: Fix UAF when reloading module
Date: Wed, 23 Apr 2025 11:07:42 -0400
Message-ID: <20250423150742.3095786-1-tavianator@tavianator.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <87wmbbjq1p.wl-tiwai@suse.de>
References: <87wmbbjq1p.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Apr 23, 2025 at 3:27 AM Takashi Iwai <tiwai@suse.de> wrote:
> On Tue, 22 Apr 2025 20:48:40 +0200, Tavian Barnes wrote:
> >
> > I'm trying to debug some audio issues on my ThinkPad X1 Carbon (Gen
> > 10), and I noticed something that's probably a bug: when I remove and
> > re-insert the snd_sof_pci_intel_tgl module, it tries to load a
> > different tplg file every time.  Example:
> >
> > # dmesg -t | grep tplg
> > sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
> > intel/sof-tplg/sof-hda-generic-idisp-4ch.tplg
> > # modprobe -r snd_sof_pci_intel_tgl
> > # modprobe snd_sof_pci_intel_tgl
> > # dmesg | grep tplg
> > sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
> > intel/sof-tplg/sof-hda-generic-idisp-4ch.tplg
> > sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
> > intel/sof-tplg/sof-hda-generic-idisp-idisp-4ch.tplg
> > # modprobe -r snd_sof_pci_intel_tgl
> > # modprobe snd_sof_pci_intel_tgl
> > # dmesg | grep tplg
> > sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
> > intel/sof-tplg/sof-hda-generic-idisp-4ch.tplg
> > sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
> > intel/sof-tplg/sof-hda-generic-idisp-idisp-4ch.tplg
> > sof-audio-pci-intel-tgl 0000:00:1f.3:  Topology file:
> > intel/sof-tplg/\xa0\x11\xaf\x0e\x8d\x8e\xff\xff\xb0\x11\xaf\x0e\x8d\x8e\xff\xff\xb0\x11\xaf\x0e\x8d\x8e\xff\xff-idisp-4ch.tplg
> >
> > The second time, it added an extra -idisp to the path
> > (intel/sof-tplg/sof-hda-generic-idisp-idisp-4ch.tplg).  The third
> > time, the path seems to have become totally corrupted.
> >
> > I'm seeing this on kernel version 6.14.3-arch1, which has no
> > sound-related changes from the regular stable 6.14.3 kernel.  I can
> > try current master but I don't see any relevant changes to the code
> > that adds -idisp in sound/soc/sof/intel/hda.c.
>
> Looks like a bug introduced by the commit
> 5458411d75947a4212e50a401ec0a98d4c6c931b
>     ASoC: SOF: Intel: hda: refactoring topology name fixup for HDA mach
> It overwrites hda_mach->sof_tplg_filename with a string of
> devm_kasprintf().

Indeed, it happened to get caught by KFENCE just now (on 6.12.24-lts).
Suggested patch below:

From: Tavian Barnes <tavianator@tavianator.com>
Date: Wed, 23 Apr 2025 10:49:54 -0400

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

Fix it by saving the filename in sof_pdata->sof_tplg_filename instead,
just like every other code path that appends to the tplg filename.

Fixes: 5458411d7594 ("ASoC: SOF: Intel: hda: refactoring topology name fixup for HDA mach")
Signed-off-by: Tavian Barnes <tavianator@tavianator.com>
---
 sound/soc/sof/intel/hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index b34e5fdf10f1..94854a24cba3 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1069,7 +1069,7 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 				if (!tplg_filename)
 					return;
 
-				hda_mach->sof_tplg_filename = tplg_filename;
+				sof_pdata->sof_tplg_filename = tplg_filename;
 			}
 
 			if (codec_num == 2 ||
-- 
2.49.0

