Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1D035BDAA
	for <linux-sound@vger.kernel.org>; Sun, 11 Oct 2026 19:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791747894; cv=pass; b=WSza4HxKZljw30yjjJvP22u6x6ZiCo2iG3d0SaczLXHK6FrQ0bj16nlH6wUInXsGpvL113wAE+KATwn423EL5afstCrdVyMuBjRdv7IPgpv5fN16apCOGBg8mkOZTI0tm8ev12EFe8E2fUD86xu3+9k6EBawUZ13W3ltDiryva4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791747894; c=relaxed/simple;
	bh=hERBEQDDdyjZ/0waIt0WKjrDpoukr5vrcu4l+cwfv48=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=sO0yHe0RKaBL8FHYyV7PPzuRWtyOAMm87Hb5dR5cqY4JjO6x74gW4JTlbMv/1cG27cHuyQ6fWJaetKpU/h7R75JFyc3PmzhkHdiyq0nQzbypLjyU3hYLTbKf4nvpNBRENqqsTqa7SRdj/Ls4EnvyMIOjdsfVuppYotxeJ9hjlUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+Y96N9d; arc=pass smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+Y96N9d"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-98c5876f2b0so555528241.2
        for <linux-sound@vger.kernel.org>; Sun, 11 Oct 2026 12:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791747892; cv=none;
        d=google.com; s=arc-20260327;
        b=S+SSvMAJFGjqbqejW/2WQJqgq6W7C0ji1skQpuyobEF/Ms6lGSbcyQeqfeVbRXkZEX
         mqQPerwMRaiPt1iG0+mKCR0b7IoQYVuTn7FFk5RCP7ybwfdNmyTSKl4VTrIjEEapZjFr
         XdhbYeuHc3MD7zly6lMDHc/30irZFkQdLfaVSSF7CDbdzELIvEV5HILYnog7HUbSKb1C
         Raq8+IruNd4cMF6L1HPH+YPZSUhLUsByjrX+HxshW95Kn+mkj4qvsJaDsl9KjnQQ93fH
         b1wWETVdS9t4E24B137k1NwDjHahSPDbVWnAxYcSAzAXN4ujPGMCe+1L4dx71C2ezDfN
         MovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=hERBEQDDdyjZ/0waIt0WKjrDpoukr5vrcu4l+cwfv48=;
        fh=1GUBQZ40wKtkaKrq9Z7Jk5guK3RFLtcnTi/UknjxHCw=;
        b=s3bDzbBG0Pe9MdTs2BKreuwJ3cbTgZudJn9FtPyNePUKDdSdTaH6VOw1Mpp8RvHRpf
         cTGonT1/7Xgj3pbel/XSbhpAHCaM0mQ3iDdvWTrKzeZ3ngT6IlcR4VEd1p5PX8A2aZ5v
         AHojl0DeoBdgC2AeKow93HaSQtievwAJM+Sejp6VTEgsqpAR8aDvDNb4T/Ng9dey//D0
         RcnFtlsx0kPYVNgFIrMMANeJ0Ij9xdaxh5vtPxR/iJxM7JmRbOYZsItVzJHWmlHRmIV1
         uOz2IljnlKRQp0023MWJ/bCii6j3VxBMckfZNhE9WAQwXxjw0fgvepgt2ffZnUohhWG5
         0NEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791747892; x=1792352692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hERBEQDDdyjZ/0waIt0WKjrDpoukr5vrcu4l+cwfv48=;
        b=D+Y96N9dep6vNa5aQg9DFL4/XiNyGCfNpleEjnBDpt4VVyVralLMZyt1Zxs2d+vH5K
         dOCaW4e3K1oGznJfXHeTebdA65bCgEr9FqVHoE6hluD5sCszxqCPseaRFqaWglFrdq9F
         LstBvHe95e5OMO1G5KO4ix0VojX3CdiZo6LJuHUKQ/IG6QGNC4M76IBHo1lNth29UT4u
         gxMjLAFswEQhpzeTxPwWapgtcNdy+q12SGDPTN8FTinCChhcLiSfsdJ9L/OFc64+1Ac4
         7NOMFnIJbwRja7nyhOIy9xyzjynvBsAPkIhf5okCZLvkHZinBMwMx63Z7YC2tzlpdwAN
         yEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791747892; x=1792352692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hERBEQDDdyjZ/0waIt0WKjrDpoukr5vrcu4l+cwfv48=;
        b=TLK5gQfKYpBA01Ft1xxIGl17f3MbExD/io1DYKjW1CmCORrG25tNsdml4fgra36NLB
         G6NOTNxFmPwb8dw0hvMwpLGv19pYureJzHVffmV+dKR5otZMUaWsjUPgJH8lUdt/dmt7
         0ksiUJX5vUA/DJqaTeNFgbJxxTXrOlaftbc0ku6NKltI5bDAglsbITClgurRxYoyvUDZ
         c+naYAawf9vtLai2Wzq3lQUWoF1jBC93iucGy4kVFb61kXE5klB2ZMeysiLozbJbVQwS
         VJl+rMXvhUTbf3afPKEKlG6sBIIEngU4HIoNLw+aQoWfUcGBvbiNC2nopp/R/PZyyD1c
         7aXg==
X-Gm-Message-State: AFq9FYLbuYZ86IcCqFr9HKtetYf/nAVEPzzjkKjKh1CA+Przy+ssnRPt
	/MQW3bgVPQb2vfDHhdyY0vjXgcH3Ot19KivRfk/MIzN8Y7urplEs4XaR9GLkzV8SQmkIWCv38bT
	5V8oP+wa60T5m8+E7vU8N7SfkzAzpGFxopMHEihs=
X-Gm-Gg: AYBFou1C1paIqZkryoPpv0fGymDZHKTF4XrFShITkZ8lP1hQ092MWVrpWEfU5l3lutz
	AvhDXxVQu5hKHgwIFOHNHnzZsEhYChdXxA7MI+VMieari3gsxLu/8Je+1uuU0hhRGcapbSJo1ss
	+RXKh0cnaXjVEHwHRpZoq9gcEitd1e8gmp3XWKuZjm82PY9IaEAo2MNgfqgYp2c9c3uvDcaezIp
	uQE9RledHqo1BH2IWQhV3QqgXQEqZb4O7XE3x/stf1GfYSXuNCg2v0e0QJrlAdBhVVMlG2IK8pq
	Lpu4Gulz1KVFuxXsAR18+iQ0mWvIeeTAiIT8W3wtdMY3Of5MrJyLcDyvL5ybn3ZdwVwplj4sJSO
	byofLY0q56z8QJObLsegy9gREOYqH9xPPC/+eCeWNuNoKLVjCyFh0IH4rZLHmD29RwBUg17Q=
X-Received: by 2002:a05:6102:951:b0:7a7:19aa:8a86 with SMTP id
 ada2fe7eead31-7cb373fd04dmr2537817137.33.1791747891887; Sun, 11 Oct 2026
 12:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Marek_Bor=C5=AFvka?= <boruvka.marek@gmail.com>
Date: Sun, 11 Oct 2026 21:44:40 +0200
X-Gm-Features: AclHuK_55jonYhS9CSW7tJImEd_JTh71TgeXndxeCjZR9JwLA4W2G3egS_1-olY
Message-ID: <CANQNuJuMA6pA1CHR1dtaC4sZJY-uw4CYQgYX23KDitA3biH+0g@mail.gmail.com>
Subject: ASoC: amd: yc: AMD-Vi IO_PAGE_FAULT at address 0xfffffffffffffffc on
 every DMIC capture start (Lenovo Yoga 7 14ARB7, 82QF)
To: linux-sound@vger.kernel.org
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

on a Lenovo Yoga 7 14ARB7 (82QF, Ryzen 5 6600U, Rembrandt/Yellow Carp ACP
rev 60, PCI 1022:15e2) the AMD IOMMU logs exactly one IO_PAGE_FAULT for the
ACP device each time a capture stream on the digital microphone (acp6x
card) is opened. The microphone itself records valid audio through
PipeWire, so this appears to be an incorrect DMA access at capture start
rather than a loss of function.

Hardware / software
-------------------
Machine: LENOVO 82QF, version "Yoga 7 14ARB7"
BIOS: K5CN48WW, 12/06/2024
CPU: AMD Ryzen 5 6600U with Radeon Graphics
Device: 33:00.5 Multimedia controller [0480]: AMD Audio Coprocessor
[1022:15e2] (rev 60), subsystem Lenovo 17aa:3859, driver in use:
snd_pci_acp6x, IOMMU group 20
Kernel: 7.2.9-200.fc44.x86_64 (Fedora 44), not tainted. The same fault
also appeared on Fedora 43 kernels 7.0.13-100.fc43 and 7.2.9-100.fc43,
so it is not a recent regression.
Modules: snd_pci_acp6x, snd_acp6x_pdm_dma, snd_soc_acp6x_mach,
snd_soc_dmic
Boot log: "acp_yc_mach acp_yc_mach.0: Enabling ACP DMIC support via DMI"
ALSA: card 2 [acp6x], device 0: DMIC capture dmic-hifi-0
User space: PipeWire 1.6.9, WirePlumber 0.5.18, alsa-lib/alsa-ucm
1.2.16.1. The default PipeWire "Digital Microphone" source is mapped by
UCM to api.alsa.path =3D "hw:acp6x".

What happens
------------
Each capture start produces one line:

snd_pci_acp6x 0000:33:00.5: AMD-Vi: Event logged [IO_PAGE_FAULT
domain=3D0x0016 address=3D0xfffffffffffffffc flags=3D0x0030]

The address is always the same, 0xfffffffffffffffc (i.e. -4), which looks
like an uninitialised or underflowed DMA pointer rather than a buffer
address. No fault is logged at boot or while no capture stream is opened.

Reproduction (reliable, one fault per run)
------------------------------------------
Fault counter: journalctl -k -g IO_PAGE_FAULT -o cat | wc -l

1. arecord -D hw:2,0 -f S32_LE -r 48000 -c 2 -d 1 /dev/null
Result: +1 fault, and arecord ends with "arecord: pcm_read:2285: read
error: Input/output error" (EIO). I only used these parameters as a quick
probe; I did not verify which hw_params the DMIC PCM actually supports,
so the EIO may be caused by my choice of format/channels.

2. arecord -f S16_LE -r 48000 -c 2 -d 1 /dev/null (default =3D PipeWire)
Result: +1 fault, recording succeeds, signal level is normal (RMS 0.0276,
peak 0.376 over 2 s with the mic in a quiet room).

3. Opening the stream from a desktop application (e.g. GNOME Settings
sound panel input meter, voice dictation) produces the fault in the same
second.

4. arecord -L (enumeration only, no capture): no fault.

5. Recording from the analog ALC287 device (hw:1,0): no fault.

The test was repeated with other audio software stopped (JamesDSP, a
PipeWire client that never opens /dev/snd itself), with the same result,
so user-space effects/filters are not involved.

Frequency over time (acp6x faults per boot, same laptop)
--------------------------------------------------------
7.0.13-100.fc43: 4, 4, 22, 4, 2, 0, 0 (Jul-Sep 2026)
7.2.6-100.fc43: 0 (4 boots)
7.2.9-100.fc43: 1, 0, 0
7.2.9-200.fc44: 0 (5 boots), then 23 on the boot where the microphone
was used repeatedly

The count follows how often the microphone is used; it is not tied to a
specific kernel version.

Not done / unknown
------------------
- I did not bisect and did not read the driver code, so the cause (e.g.
DMA address programmed before the buffer is set up, or a stale value on
stop) is only a guess from the constant -4 address.
- I did not test with amd_iommu=3Doff / iommu=3Dpt (that would only change
whether the fault is reported, not why the access happens).
- I did not check whether captured audio is damaged at the very start of
a stream.

I can test patches and provide more logs (dmesg with dyndbg for
sound/soc/amd/yc/, lspci -vv, alsa-info) if useful.

Thanks,
Marek Bor=C5=AFvka
