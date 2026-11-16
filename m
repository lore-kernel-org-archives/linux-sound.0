Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794792253;
	b=Nj6u6F1UE8Kr5nOCfh1BcJ1JHG7UN1f0XzrbDhvJ4Fao+7kRCELeTSQUP9M3xgbEFV3r
	 F+0UbHV0my+200g4SswHyd7mviVV97NQNsmbmqlLuVV1hN/fa/TqqIdMq8xr7zM76cuYu
	 imkc3d49az566glI4UWhdjObiMO9rQ+DPhWQOILL04PSzGuuwt8ESYPBzDdwn+/M4tpvg
	 95/WgQ/GNde78FkPFID1gg4GamIDL0XJmPEyu5yERu1lAVbFweIKTgelhN4WIrxK3YB62
	 1ga5Cc2ZK3FhpWxhnVPvBME+CEZ3gU30p5w4CMPCwusEXwRzMjwDQjR162m/M24Rq7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=r7vL0qrifdEMu6hnfiQ4kzrLVyL8oBEHcc38n/hRip4=;
	b=CugWbJz6ihpjZkWneC4Nb+YZmW3kBif38MgLB273nhepGGpKVcKdYj9xfozj5vmYD+s5
	 FKUQi/k0JINwXmr8D5KqQr650nxkcaSvua4BzhQq1/eHCy4ZaSySA0wSyiWKCs7sRZZAc
	 x1kAHm9DGiJpVVlxKniv7XKGfqQ9iJT5miUf76/x+XVS+NGC+HxNJ7CwlFOYfpNUiemRd
	 5zWP7otoXzV27x44fp5wCSLBoBdTwgtNOnmfITGX83H+Grt8W259O+xlxo2wcsKQzZ7M8
	 jduSW9YVf4zJgdV3gPVf56bRSNYhfo9Vxxp6tyCF0auiM2a2Xk95NcjEBmc4LVW3x7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nuqJn7NW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49890606A323
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 01:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49890606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nuqJn7NW
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so3075745e9.1
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 17:24:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794792252; cv=none;
        d=google.com; s=arc-20260327;
        b=BZ/8rvikJ3F+5UU17un79UttlXAMDmEGohElyAzMfbkxtKZI07JEZ4KfGo+e2Z4i+u
         YrPaoIBn3w4lgrWqCJbdCnYN6FnT9+wdsATqL+K/nK3czmLKydG3knrey3keXVKDEGg2
         GdbQ27uAe1S933WHbXGBbft7srUXNIRJMMTTP6z28tdwZzPWAR5qfkxjcu6iGHdAsOFL
         Qg+jYuv4yDGrIS8/V45PJOTHs0oOlrI+XVdijfh++8q7YrgSGSYqR0N1hwyy3ah9K/xq
         z8HvgAEz4PoiA5H784KGh5C5F8Kk91yVM0IKgqPGbPHsA3FDZaqfgzD4pE/OyeND3hlC
         aJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=r7vL0qrifdEMu6hnfiQ4kzrLVyL8oBEHcc38n/hRip4=;
        fh=j03cro42PHmovQm51OLzJ1o7ZxPDlOKyVnPjvLccdKE=;
        b=VYCsVmv6WJ5iKiM3G9yb+GQ7Do2RYDc+DLVuBpVZMej9H7OwXWY7N51h9BSrIa1JnD
         YcZuD/YkVCHRsvztU4s8Ip+VZqMdR+kXf8UTRJQ7u7qpQbEnymQMeHuR3b2SkjBPK8Dk
         8Vx0uVfC10DjuKCxAELTf1MRylW/uXkM8rVeHLH+vKceLhOCZkswsEIhEpv7P+ZS8hFb
         Hcr7v+3VOjv4ltZhpFQBtbxxmDRrNoBEhRzwxZ2xP+J9IfhBjGNhh2f1IgfAv7HQBDWy
         Apf13xveiqK4lFayNoeH6SwkX9QHjI35632XnIbv8JJD8S47rplk7/w+Ovf/GSqiq7NA
         qsFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794792252; x=1795397052; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7vL0qrifdEMu6hnfiQ4kzrLVyL8oBEHcc38n/hRip4=;
        b=nuqJn7NW9lMUsb8EDML59apEX5MjFBCUyO4+WsSliUSLf/w30eKx99p2NUak/Go7wD
         ciipjVpQP0a33PbNJaixS8RQQi0m9Hu3KW0KPMhloSW1cHJTiGkRMi/W4z8/LQ5Oi0sH
         2zKeYRWXp4JU50GniIhhBKn3sMw6NPrwEwwD7hU2NBIV3OPQP4KHSOhRcAAywECIZh3X
         7cMo5FW7pZxGNoRjDGPhLYmEEdABgTFuGGKnEPFLjfJXqtqknznZm9gnB50hh9Bv9Eq4
         FRVG5k6J7WxTyJpvY4OylK6dr14BK1e5vtIc0oGn6gQCvt9kADZsT7WEVepqXEicQqj2
         KrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794792252; x=1795397052;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r7vL0qrifdEMu6hnfiQ4kzrLVyL8oBEHcc38n/hRip4=;
        b=1nqdhJuv8Jr4G7OsnS4XzLEpxTAzeGad9bVxdAiDWtlz7JFZZhOseJLEH3YvZbZzzE
         J/jURPfB9BJaWsu7jOKVBOykoac2jifqsvIyGmxmSjZFQ7KA07V7JEIO1byPaDOjCqaG
         HoBBlrOyJev9uJwTPnvu/NHvKbKpjDRW/Ya3gu5/t9LzdHbo9ZmK1qjQQI75gFi2AEBP
         XgNXun3iKt0Ps/Y224Aj5TrNDVcQMwRTEkqlxcAOyrBycyBYKDJJU9KHyfZMvHIem5sQ
         2GMHzjuWIYbh2J3hdNIatXh9zrRgINox9GViyS1OL91AG+j0wIMU29lnS1Sblj8zw/vE
         atrg==
X-Gm-Message-State: APuU4Z/zIAZO+OtdBEVhQrZjw3EcvFVBCiR0Cmg5Vn6pgTzWweiraELD
	iMism635PJZGhUw3zSugI3W6XM0Qnt2TUxeWJwUfUlgkdGehMOnZ/HBX0WezT//BIg+cr5vBBAX
	XR/mvq3G+gWQPq4Z5Ndpp60pTGA5RjsGhq5YDnkbjRg==
X-Gm-Gg: AYBFou14NLOFge3qEy6Iu8CWS1bcphNJ5dGtDEn1DXIDlZBq8gV4FB+KUu/wFuhlivV
	6i5x/j1o2qQ0MWGSNn4VwjcrpRY2pzG+gSjBP7jM/LAABJAQoMHAbZA1+lGLQZBClHnX0A9YXcU
	WLkfMj1wRvrf7rBuCf0l2TqYVCVFzH8JY9HDxC5Up+W3D7d7dKwHh5cDQSSZ6tX7dbki9T29D5H
	eePBJRmFLekc1aoradhNEzUNBISwVBNWvFBvFzV45VnhB6bcvx9NPtdtAR4qInwRUNB3AayFi1v
	jWdBtwimuL0D/5xJrpdnReul01qZg05o9iI/U2ZXZNY93Xt6Ifjc7Hwi/0XhBRzBHbBPMTytqgh
	ctSgua4EMXRrjERNx5oKvg6vOJDEDIIQhaXDa
X-Received: by 2002:a05:600c:3f18:b0:4bb:6ac0:6dc0 with SMTP id
 5b1f17b1804b1-4bb6ac06e5dmr57112905e9.29.1794792251495; Sun, 15 Nov 2026
 17:24:11 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: william <assassinshalo29@gmail.com>
Date: Sun, 15 Nov 2026 20:24:00 -0500
X-Gm-Features: AclHuK-vjL1wmMPjBQCKuN5LdAtAqjLjQE_NAzaw7x4qYE1TjyXWc0GBGd6bI1U
Message-ID: <CAFjFWEjt+DPJ_gM1uTBZ_NoV6-3mi57ArjZ_Qdah2DqY-GCD1w@mail.gmail.com>
Subject: [REGRESSION] ALSA: hda/realtek: no speaker sound on Lenovo Legion
 16IRX9H since f2293e7b2ddd (PCI SSID 17aa:3842 shared with ThinkBook X G2 IAH)
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de, evgeny@devduty.com, stable@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,
Commit f2293e7b2ddd ("ALSA: hda/realtek: Enable all four speaker amps on Lenovo
ThinkBook X G2 IAH", Cc: stable) matches the laptop by PCI SSID
17aa:3842, on the
assumption that this SSID had no quirk entry. The Lenovo Legion 16IRX9H (83DE)
has the same PCI SSID, so its internal speakers are silent on kernels that carry
this commit. Headphones work.
Hardware
Lenovo Legion 16IRX9H, product 83DE, BIOS N2CN32WW
Codec: Realtek ALC287, codec SSID 17aa:38cd, PCI SSID 17aa:3842
Amplifier: ACPI TIAS2781:00 (i2c-TIAS2781:00 on i2c_designware.2),
driver snd_hda_scodec_tas2781_i2c
Kernels
Works: 7.2.10-200.nobara.fc44, 7.1.6-1-cachyos (live ISO)
Fails: 7.3.4-201.nobara.fc44, 7.3.4-1-cachyos
The 3842 entry is absent from v7.2 and v7.3, present in v7.3.4, and still
present in v7.4-rc1 and master as of 2026-11-15 (checked via the GitHub mirror).
Analysis
snd_hda_pick_fixup() walks the table and matches PCI-SSID entries before the
codec-SSID fallback. Before the commit, 17aa:3842 had no entry, so this machine
fell through to the existing codec-SSID entry
SND_PCI_QUIRK(0x17aa, 0x38cd, "Y790 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
which works. With the commit, the 3842 entry wins and chains to
cs35l41_fixup_i2c_four(), so the codec master waits for four CS35L41 components
that do not exist on this machine.
Evidence on 7.3.4
dmesg: "ALC287: picked fixup for PCI SSID 17aa:3842"; no "bound i2c-TIAS2781:00"
line (on 7.2.10 that line is present).
/sys/kernel/debug/device_component/hdaudioC0D0: master "not bound",
four entries "(unknown) not registered".
With dyndbg, after "echo 1 > /sys/class/sound/hwC0D0/reconfig":
hdaudioC0D0: trying to bring up adev
hdaudioC0D0: Looking for component 0
hdaudioC0D0: master has incomplete components
After unbinding/binding i2c-TIAS2781:00, tas2781-hda logs "adding component"
but the master still reports incomplete components.
Workaround confirmed
Booting with snd_hda_intel.model=17aa:38cd (alias SSID, handled first by the
picker) gives:
ALC287: picked fixup for alias SSID 17aa:38cd
bound i2c-TIAS2781:00 (ops tas2781_hda_comp_ops [snd_hda_scodec_tas2781_i2c])
and the speakers work.
Possible direction
Since both laptops share the PCI SSID, the ThinkBook entry cannot be fixed by
PCI SSID alone. One option is a codec-SSID entry for this machine placed before
the 0x3842 line, e.g.
HDA_CODEC_QUIRK(0x17aa, 0x38cd, "Legion 16IRX9H / Y790 VECO DUAL",
ALC287_FIXUP_TAS2781_I2C),
I have not compiled or tested a patch, only the model= alias above. I am happy
to test patches on this hardware.
Separate observation
After the workaround, speakers still stopped after some idle time. It went away
with snd_hda_intel power_save=0 power_save_controller=N and keeping
i2c-TIAS2781:00 power/control at "on". I applied both at once, so I do not know
which is required. This looks unrelated to the regression above.

I'd really appreciate it if the issue is fixed, as I'm now having the
same problem when the laptop is turned on after being suspended for a
while, and I haven't been able to solve it.
Thanks,
William
