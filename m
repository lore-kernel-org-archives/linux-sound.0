Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265D23F23BB
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 09:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093864; cv=none; b=MGSVSq/VPIoEgqETpR6limlKph030M/83mt1YROHOH1oodQNts1YPJa3O29yMgEHtBfhu+5xM/zQSZDpJIWNN6R2pq7o2ze8G9DYijQ1TNypi+XlZWkLEqTeOh6aFyRts4H/2xExEbXfW+s9y+qmDuxsqrF4Ip5lu6y3L9hZ+V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093864; c=relaxed/simple;
	bh=iiYbVgd5Uoqfl+NamwpSM0ZeNswgLK/g8fBYwK58fYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P7obMxe0ufPOIe1Lj1+T0NkITQ8/HIlnDj0rRrSWXueppmFJnmGQOafioANWMLVTDJIsbU8h4kyq7U/0gD4Qs72BcCDg11hkvAt3Ox4woL9MrhBHOAMIeC+xqJGPuuRU5X9kAAHkQXO4AhRsSB1WIcfG1F3fXikLPKYcngZSJw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMeE4l+m; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMeE4l+m"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2423504a91.2
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 02:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786093860; x=1786698660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vG0U+8Qk1yyxGPH+pjVoMTlUBau5DlBVYfocH1JZGYw=;
        b=XMeE4l+mANndpqGvjkCc3JhXCKfNk5KYQG3VaVqOk/umENoSfiKCOcT1KseUCCxgPj
         UyWV+yXEV0jm187v7JbMCLBiVT53ckmgImezSnQW8zBhHTjUX5AwPDKdW9URJhWzGk0c
         0XP51dG+aLhH8VYni6+gqxTZEeen8CY3+vO4KfGJyX2AsHE7tVlsU4Bm63I5Y6UlHXOe
         qZPdTqNFAW/K841Jl8R7wPUktGul906d+zcmFnjOIBJPMcH9uthNrIdtjfqjEaPLJwgc
         QyjvdhoE/6WteHT9toRFs/VEct92slbtAxj4bSplDzx1N9mol2e08+UdW+XUowxagtXf
         9OQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093860; x=1786698660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vG0U+8Qk1yyxGPH+pjVoMTlUBau5DlBVYfocH1JZGYw=;
        b=XVeuENWvosvrackBj/Gj30yPW10vCxDeW7LsGjcuQYQep+rnAijeTX7C3tI2tX8/PK
         UQnvj+mGlWMhFoTs3odCl4UnlTwAH3E8qGAM2Hp7Z8jozOjh5TVa7uv8fGWsMiH4p3KI
         5uiQGXCx/OR2i1AIVM2X3EKXThFYMAfTFLj0rCBCoDtu4X/gPpnT0hNrDqCalMa6sdcM
         UuD5RgybmWX9wdcd89mreU0CFCwexbeaE77MsghIxFkKr1truvN/kNnug/piE6k3EA5t
         M4CxUAhLU+5GIgGa6IYIm1W4REOM8dBGwdCv+mkJOlzO4x+gL2ZwoDzwDfdI5ge9Wag0
         LyHQ==
X-Gm-Message-State: AOJu0Yz6WpDX7DM9cBODEhvENZM6PerchKOtPFBZV7kqXGlbjfwAMxm8
	EZUrDC0JWqd2NtJBuBybhRt90O1jdTYF788iefJi5VX3qNqa1xFnocKx/sWjBPOj
X-Gm-Gg: AR+sD119Em/AB2QC69GctLWV4/ZwN0tPJlrIVkMbajErXwlgPtrRppMPhXiK4q3M7ra
	4vEXtEoQh8IMA+z5YzAv2eyCgVneRW+w6r9bd/sdMp0uTRFz2F9J4UFRVGjhAqpT5iVXI3lJaaI
	MXyI3qpehrA81Rs181oolaciPsvgKcW5+4CoP7uQLAboGbmA461BxbBm/2usQMF+5qpH3SeZOvy
	49W1HbR7Bb4odU1FPZql8KVeC+3Ry9et/0MT6XIx7JGTx0SyHrSY4qnWqaY1lYgePQsv14vcwtA
	8Y3JTdZNFGd5rl+6hz1I+Kv+gzDwkzpiOHZmTFdY4ITOklHqBxZheTkX7mj37j1QAPlIDbij607
	oAgdopzEgpgjcS78Bce+rBgcx91s12bu7XyMwDGAPfuyARDsCjPU748KF5j8NNc4GoD5ymQ4JEt
	8nwmqEsAFhr5/1bYapV72gWoElszvCBKfRnTxWVIN0MVQTMQ==
X-Received: by 2002:a17:90b:590e:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-3909d301d9cmr8750694a91.0.1786093859527;
        Fri, 07 Aug 2026 02:10:59 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fd957cesm1740317a91.6.2026.08.07.02.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:10:58 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-kernel@vger.kernel.org
Subject: [REGRESSION / HELP] sound/soc/amd: No sound after suspend/resume on RPL (merged into YC driver)
Date: Fri,  7 Aug 2026 17:10:46 +0800
Message-ID: <20260807091047.9264-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi maintainers,

I am writing to seek help/report an issue regarding audio losing functional=
ity after suspend/resume.

Previously, I merged the acp6x RPL support into the YC driver in commit:
df4148a5a3cf ASoC: Add DMIC support for the AMD RPL platform

Audio output works normally on fresh boot.
After triggering suspend (s2idle) and resuming the system, audio stops work=
ing completely.

[dmesg Log]
[    6.142953] calling  rn_acp_driver_init+0x0/0xff0 [snd_rn_pci_acp3x] @ 9=
12
[    6.144924] initcall rn_acp_driver_init+0x0/0xff0 [snd_rn_pci_acp3x] ret=
urned 0 after 1213 usecs
[    6.253716] calling  snd_amd_acp_pci_driver_init+0x0/0xff0 [snd_acp_pci]=
 @ 912
[    6.253744] initcall snd_amd_acp_pci_driver_init+0x0/0xff0 [snd_acp_pci]=
 returned 0 after 23 usecs
[    6.300683] calling  hda_bus_init+0x0/0xff0 [snd_hda_core] @ 907
[    6.300707] initcall hda_bus_init+0x0/0xff0 [snd_hda_core] returned 0 af=
ter 13 usecs
[    6.322903] calling  azx_driver_init+0x0/0xff0 [snd_hda_intel] @ 907
[    6.323030] snd_hda_intel 0000:01:00.1: enabling device (0000 -> 0002)
[    6.323128] snd_hda_intel 0000:01:00.1: Disabling MSI
[    6.323135] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio clie=
nt
[    6.323250] snd_hda_intel 0000:07:00.1: enabling device (0000 -> 0002)
[    6.323300] snd_hda_intel 0000:07:00.1: Handle vga_switcheroo audio clie=
nt
[    6.323341] snd_hda_intel 0000:07:00.6: enabling device (0000 -> 0002)
[    6.323390] initcall azx_driver_init+0x0/0xff0 [snd_hda_intel] returned =
0 after 480 usecs
[    6.332088] calling  generichdmi_driver_init+0x0/0xff0 [snd_hda_codec_hd=
mi] @ 1078
[    6.332109] initcall generichdmi_driver_init+0x0/0xff0 [snd_hda_codec_hd=
mi] returned 0 after 13 usecs
[    6.334872] calling  nvhdmi_driver_init+0x0/0xff0 [snd_hda_codec_nvhdmi]=
 @ 1079
[    6.335493] calling  atihdmi_driver_init+0x0/0xff0 [snd_hda_codec_atihdm=
i] @ 941
[    6.336448] snd_hda_intel 0000:07:00.1: bound 0000:07:00.0 (ops amdgpu_d=
m_audio_component_bind_ops [amdgpu])
[    6.337487] initcall atihdmi_driver_init+0x0/0xff0 [snd_hda_codec_atihdm=
i] returned 0 after 1889 usecs
[    6.339335] calling  generic_driver_init+0x0/0xff0 [snd_hda_codec_generi=
c] @ 1081
[    6.339358] initcall generic_driver_init+0x0/0xff0 [snd_hda_codec_generi=
c] returned 0 after 17 usecs
[    6.341222] initcall nvhdmi_driver_init+0x0/0xff0 [snd_hda_codec_nvhdmi]=
 returned 0 after 993 usecs
[    6.343098] calling  conexant_driver_init+0x0/0xff0 [snd_hda_codec_conex=
ant] @ 948
[    6.343118] snd_hda_codec_conexant hdaudioC2D0: SN6140: BIOS auto-probin=
g.
[    6.343542] snd_hda_codec_conexant hdaudioC2D0: SN6140: picked fixup  fo=
r codec SSID 17aa:0000
[    6.343605] snd_hda_codec_conexant hdaudioC2D0: autoconfig for SN6140: l=
ine_outs=3D1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[    6.343609] snd_hda_codec_conexant hdaudioC2D0:    speaker_outs=3D0 (0x0=
/0x0/0x0/0x0/0x0)
[    6.343611] snd_hda_codec_conexant hdaudioC2D0:    hp_outs=3D1 (0x16/0x0=
/0x0/0x0/0x0)
[    6.343613] snd_hda_codec_conexant hdaudioC2D0:    mono: mono_out=3D0x0
[    6.343614] snd_hda_codec_conexant hdaudioC2D0:    inputs:
[    6.343615] snd_hda_codec_conexant hdaudioC2D0:      Mic=3D0x19
[    6.347674] initcall conexant_driver_init+0x0/0xff0 [snd_hda_codec_conex=
ant] returned 0 after 652 usecs
[    6.526509] probe of acp_yc_pdm_dma.0 returned 0 after 26 usecs
[    6.526512] acp_yc_mach acp_yc_mach.0: Enabling ACP DMIC support via DMI
[    6.526734] probe of acp_yc_mach.0 returned 0 after 246 usecs
[   16.054575] snd_hda_intel 0000:01:00.1: calling  nv_msi_ht_cap_quirk_lea=
f+0x0/0x30 @ 2245
[   16.054586] snd_hda_intel 0000:01:00.1: nv_msi_ht_cap_quirk_leaf+0x0/0x3=
0 took 3 usecs
[   32.373277] snd_hda_codec_conexant hdaudioC2D0: PM: calling hda_codec_pm=
_suspend [snd_hda_codec] @ 973, parent: 0000:07:00.6
[   32.373280] snd_hda_codec_nvhdmi hdaudioC0D0: PM: calling hda_codec_pm_s=
uspend [snd_hda_codec] @ 2608, parent: 0000:01:00.1
[   32.373286] snd_hda_codec_atihdmi hdaudioC1D0: PM: calling hda_codec_pm_=
suspend [snd_hda_codec] @ 825, parent: 0000:07:00.1
[   32.373803] acp_yc_mach acp_yc_mach.0: PM: calling platform_pm_suspend @=
 4869, parent: 0000:07:00.5
[   32.373813] acp_yc_mach acp_yc_mach.0: PM: platform_pm_suspend returned =
0 after 6 usecs
[   32.373822] acp_yc_pdm_dma acp_yc_pdm_dma.0: PM: calling platform_pm_sus=
pend @ 4869, parent: 0000:07:00.5
[   32.373828] acp_yc_pdm_dma acp_yc_pdm_dma.0: PM: platform_pm_suspend ret=
urned 0 after 2 usecs
[   32.383535] snd_hda_codec_atihdmi hdaudioC1D0: PM: hda_codec_pm_suspend =
[snd_hda_codec] returned 0 after 10235 usecs
[   32.383547] snd_hda_intel 0000:07:00.1: PM: calling pci_pm_suspend @ 495=
9, parent: 0000:00:08.1
[   32.383557] snd_hda_intel 0000:07:00.1: PM: pci_pm_suspend returned 0 af=
ter 5 usecs
[   32.384686] snd_hda_codec_nvhdmi hdaudioC0D0: PM: hda_codec_pm_suspend [=
snd_hda_codec] returned 0 after 11394 usecs
[   32.384702] snd_hda_intel 0000:01:00.1: PM: calling pci_pm_suspend @ 495=
8, parent: 0000:00:01.1
[   32.385395] snd_hda_codec_conexant hdaudioC2D0: PM: hda_codec_pm_suspend=
 [snd_hda_codec] returned 0 after 12105 usecs
[   32.385406] snd_hda_intel 0000:07:00.6: PM: calling pci_pm_suspend @ 495=
7, parent: 0000:00:08.1
[   32.385509] snd_hda_intel 0000:01:00.1: PM: pci_pm_suspend returned 0 af=
ter 803 usecs
[   32.386452] snd_hda_intel 0000:07:00.6: PM: pci_pm_suspend returned 0 af=
ter 1042 usecs
[   32.548232] snd_hda_intel 0000:07:00.6: PM: calling pci_pm_suspend_late =
@ 1934, parent: 0000:00:08.1
[   32.548238] snd_hda_intel 0000:07:00.6: PM: pci_pm_suspend_late returned=
 0 after 0 usecs
[   32.548247] snd_hda_intel 0000:07:00.1: PM: calling pci_pm_suspend_late =
@ 773, parent: 0000:00:08.1
[   32.548248] snd_hda_intel 0000:01:00.1: PM: calling pci_pm_suspend_late =
@ 753, parent: 0000:00:01.1
[   32.548256] snd_hda_intel 0000:07:00.1: PM: pci_pm_suspend_late returned=
 0 after 0 usecs
[   32.548265] snd_hda_intel 0000:01:00.1: PM: pci_pm_suspend_late returned=
 0 after 0 usecs
[   32.550201] snd_hda_intel 0000:07:00.6: PM: calling pci_pm_suspend_noirq=
 @ 4965, parent: 0000:00:08.1
[   32.550208] snd_hda_intel 0000:01:00.1: PM: calling pci_pm_suspend_noirq=
 @ 753, parent: 0000:00:01.1
[   32.550315] snd_hda_intel 0000:07:00.1: PM: calling pci_pm_suspend_noirq=
 @ 773, parent: 0000:00:08.1
[   32.563453] snd_hda_intel 0000:07:00.6: PM: pci_pm_suspend_noirq returne=
d 0 after 13245 usecs
[   32.564480] snd_hda_intel 0000:07:00.1: PM: pci_pm_suspend_noirq returne=
d 0 after 14160 usecs
[   32.574594] snd_hda_intel 0000:01:00.1: PM: pci_pm_suspend_noirq returne=
d 0 after 24381 usecs
[   34.136842] snd_hda_intel 0000:07:00.6: PM: calling pci_pm_resume_noirq =
@ 773, parent: 0000:00:08.1
[   34.149039] snd_hda_intel 0000:07:00.1: PM: calling pci_pm_resume_noirq =
@ 4967, parent: 0000:00:08.1
[   34.152548] snd_hda_intel 0000:07:00.6: PM: pci_pm_resume_noirq returned=
 0 after 15697 usecs
[   34.161115] snd_hda_intel 0000:07:00.1: PM: pci_pm_resume_noirq returned=
 0 after 12069 usecs
[   34.528188] nvidia 0000:01:00.0: calling  quirk_nvidia_hda+0x0/0x80 @ 13=
46
[   34.528200] nvidia 0000:01:00.0: quirk_nvidia_hda+0x0/0x80 took 4 usecs
[   34.528251] snd_hda_intel 0000:01:00.1: PM: calling pci_pm_resume_noirq =
@ 1344, parent: 0000:00:01.1
[   34.528313] snd_hda_intel 0000:01:00.1: calling  nv_msi_ht_cap_quirk_lea=
f+0x0/0x30 @ 1344
[   34.528325] snd_hda_intel 0000:01:00.1: nv_msi_ht_cap_quirk_leaf+0x0/0x3=
0 took 5 usecs
[   34.528331] snd_hda_intel 0000:01:00.1: PM: pci_pm_resume_noirq returned=
 0 after 69 usecs
[   34.529178] snd_hda_intel 0000:01:00.1: PM: calling pci_pm_resume_early =
@ 4978, parent: 0000:00:01.1
[   34.529187] snd_hda_intel 0000:01:00.1: PM: pci_pm_resume_early returned=
 0 after 0 usecs
[   34.529210] snd_hda_intel 0000:07:00.1: PM: calling pci_pm_resume_early =
@ 219, parent: 0000:00:08.1
[   34.529212] snd_hda_intel 0000:07:00.6: PM: calling pci_pm_resume_early =
@ 4978, parent: 0000:00:08.1
[   34.529215] snd_hda_intel 0000:07:00.1: PM: pci_pm_resume_early returned=
 0 after 0 usecs
[   34.529218] snd_hda_intel 0000:07:00.6: PM: pci_pm_resume_early returned=
 0 after 0 usecs
[   34.532175] snd_hda_intel 0000:01:00.1: PM: calling pci_pm_resume @ 4974=
, parent: 0000:00:01.1
[   34.532434] snd_hda_intel 0000:07:00.6: PM: calling pci_pm_resume @ 4992=
, parent: 0000:00:08.1
[   34.536184] snd_hda_intel 0000:01:00.1: PM: pci_pm_resume returned 0 aft=
er 4003 usecs
[   34.536193] snd_hda_codec_nvhdmi hdaudioC0D0: PM: calling hda_codec_pm_r=
esume [snd_hda_codec] @ 4974, parent: 0000:01:00.1
[   34.536340] snd_hda_codec_nvhdmi hdaudioC0D0: PM: hda_codec_pm_resume [s=
nd_hda_codec] returned 0 after 0 usecs
[   34.635460] snd_hda_intel 0000:07:00.6: CORB reset timeout#2, CORBRP =3D=
 65535
[   34.635469] snd_hda_intel 0000:07:00.6: PM: pci_pm_resume returned 0 aft=
er 103028 usecs
[   34.635475] snd_hda_codec_conexant hdaudioC2D0: PM: calling hda_codec_pm=
_resume [snd_hda_codec] @ 4992, parent: 0000:07:00.6
[   34.635503] snd_hda_codec_conexant hdaudioC2D0: PM: hda_codec_pm_resume =
[snd_hda_codec] returned 0 after 0 usecs
[   34.637039] Modules linked in: nft_masq veth bridge stp llc rfcomm snd_s=
eq_dummy snd_hrtimer nft_nat nft_redir tun overlay nf_conntrack_netbios_ns =
nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_r=
eject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf=
_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nvidia_uvm(OE) nf_tables nf=
netlink qrtr bnep sunrpc binfmt_misc vfat f2fs fat nvidia_drm(OE) snd_ctl_l=
ed nvidia_modeset(OE) snd_soc_acp6x_mach snd_soc_dmic snd_acp6x_pdm_dma snd=
_sof_amd_acp70 snd_sof_amd_acp63 snd_sof_amd_vangogh snd_sof_amd_rembrandt =
snd_sof_amd_renoir snd_sof_amd_acp snd_sof_pci snd_sof_xtensa_dsp amd_atl s=
nd_sof intel_rapl_msr intel_rapl_common iwlmvm snd_sof_utils nvidia(OE) snd=
_pci_ps snd_soc_acpi_amd_match snd_amd_sdw_acpi mac80211 soundwire_amd snd_=
hda_codec_conexant soundwire_generic_allocation soundwire_bus snd_hda_codec=
_generic edac_mce_amd snd_hda_codec_atihdmi snd_hda_codec_nvhdmi snd_soc_sd=
ca snd_hda_codec_hdmi snd_hda_intel uvcvideo snd_soc_core
[   34.637104]  kvm_amd snd_hda_codec uvc btusb videobuf2_vmalloc videobuf2=
_memops libarc4 btmtk snd_hda_core snd_compress videobuf2_v4l2 ac97_bus btr=
tl kvm snd_pcm_dmaengine snd_intel_dspcfg videobuf2_common btbcm snd_acp_pc=
i snd_intel_sdw_acpi btintel snd_hwdep snd_amd_acpi_mach iwlwifi spd5118 vi=
deodev snd_seq snd_acp_legacy_common irqbypass bluetooth snd_pci_acp6x snd_=
seq_device mc rapl bitland_mifs_wmi cfg80211 pcspkr sparse_keymap snd_pci_a=
cp5x wmi_bmof snd_pcm r8169 snd_rn_pci_acp3x snd_timer snd_acp_config joyde=
v snd realtek snd_soc_acpi i2c_piix4 rfkill wireless_hotkey amd_pmc phy_pac=
kage k10temp i2c_smbus snd_pci_acp3x soundcore zstd zram lz4hc_compress lz4=
_compress amdgpu drm_buddy amdxcp i2c_algo_bit drm_ttm_helper ttm drm_exec =
ucsi_acpi drm_panel_backlight_quirks typec_ucsi gpu_sched hid_multitouch nv=
me typec drm_suballoc_helper drm_display_helper thunderbolt i2c_hid_acpi nv=
me_core i2c_hid cec video nvme_keyring wmi nvme_auth sp5100_tco serio_raw f=
use i2c_dev uinput
[   34.740640] snd_hda_intel 0000:07:00.1: PM: calling pci_pm_resume @ 219,=
 parent: 0000:00:08.1
[   34.740803] acp_yc_pdm_dma acp_yc_pdm_dma.0: PM: calling platform_pm_res=
ume @ 4869, parent: 0000:07:00.5
[   34.740815] acp_yc_pdm_dma acp_yc_pdm_dma.0: PM: platform_pm_resume retu=
rned 0 after 6 usecs
[   34.740826] acp_yc_mach acp_yc_mach.0: PM: calling platform_pm_resume @ =
4869, parent: 0000:07:00.5
[   34.740833] acp_yc_mach acp_yc_mach.0: PM: platform_pm_resume returned 0=
 after 4 usecs
[   34.742747] snd_hda_intel 0000:07:00.1: PM: pci_pm_resume returned 0 aft=
er 2097 usecs
[   34.742778] snd_hda_codec_atihdmi hdaudioC1D0: PM: calling hda_codec_pm_=
resume [snd_hda_codec] @ 4992, parent: 0000:07:00.1
[   34.742796] snd_hda_codec_atihdmi hdaudioC1D0: PM: hda_codec_pm_resume [=
snd_hda_codec] returned 0 after 0 usecs
