Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794445891;
	b=0D/+O5Edu70j6wlSmzZJR7Qb7yYgUfiGB1GTkEN+ftnP4mtsl3TYbjvO+ITDLXUftJ2t
	 30rj8tuTjsK6k09uX0BlLZkbY6Nat/yb2nDO6P45WVeRYm0wcgqRXqujzCjQ4bJtM/cjX
	 artu+GZQ5Rbejy11g8/dFT1SuVt+MJBgRH03dK4al0646Ai5nvDr5YFtcCV+8o9r01F7H
	 RDCxJDAOz0AeByID0JuMsAJdy1yx1Qqj6TOBQw8Bgnw1OaCdRy6PkMk2wxD68n3OY9/fs
	 cLXT4IsEgL8nNDrT7oFSD4qKn1obQV0XfcYBalTdlWvFbBMzzUjGzkZCay+2ytzOsjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=xvLH80QhcDE1RiaDk2FJzwKTRJlmrkikJoyyX/2FYOM=;
	b=Vru/PL1c69lhqKeyLAp6RJ9Atxm5S9N2xClzqRD3NR5hdpohilCXamBcWh5hgP5LMb7T
	 nvzKQ1of1XL1QQdtmiQCSRrHNCe580Gch32N3AvKnlSxeZNVdCTrhAK2jXuWqyov6+Zt5
	 VqKE+Rq3RQXzpGu9ua+a92twbSN7mZBy7LeJQrbmNKFdW1rzABVAY+6Xe8qtfM7MptMyb
	 Da0nn6lARUwmDWLo5nglxRjhSsBr0AXrP+J5FhBWASbN6S0GCnxYGMLQ6ChjBLJ4Q34ag
	 9hMOpHRTrBoUwrFyKRLBVbHjWWQnebFCAqCS6B3XylVCPD8FXDmomQoFDfECII/wb7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xbenhs3M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DAD606A883
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 01:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2DAD606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xbenhs3M
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5363316fa0cso40918971cf.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 17:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794445890; cv=none;
        d=google.com; s=arc-20260327;
        b=qmApADNPwJmBgijAgjRHYaYaDRelgIdRlNdKPlJ+9EouqcvKaBZEW0Ir9bOhVkINbf
         wRLGbyOZ8l4hWBKuGyUOAO1pIxvYnaKDN7j1vt5EtK07ik1LNC7yhgb8SZ6lxzXroFFX
         VUUGhZUZAYVcOkM6PowaInB1nSrZ4ilnLhjMJkBE85KFqvf073t79WxvgGFEYzp/47Ds
         QFisESj5WPi2UxQxKQWtPtA4frRrS/dnObvUfsFaUGcJiedx3rOBkbc+4Sn7/MiNJI0L
         3X+TKACyejjC4Cgzw5h1gsmJWXzPhhwOpBXMhv4hFqHBLakweC0aqXJb2qOCf6RXToXJ
         WY2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xvLH80QhcDE1RiaDk2FJzwKTRJlmrkikJoyyX/2FYOM=;
        fh=nX/6up8GixXLXn44OplGqo+DsN+OdXjPjOWgBvKwQPg=;
        b=gkwrY95NA5kYPKmlwqMm52/fdzSqvtmDBHI93qC+BjoUHfC33GteTTCrXdCEIVMDKp
         ynU6hazYHwMMeCQZy4LS3qSdtzHiMVjrP/tHgiYg7d/dH6StHSumodZkPJEIGu0r57+r
         wxgfM4uUmK9vz4OcIXIX7sgRDJ6Cr36qe1PQqXXL1DCupDzZQM0HeShwGPPMU8znMGlv
         9pzm0iBq2zwPc78k3zgFuxPuFUcH2KjvTMMs+qkVIx4O6HT5hSpGBr8swle9DiLcjin3
         jCdgOYsqI93dKYwQ1MKMHO1cIjyWeWG+ZAuk3SKiRM0zzEJCIuiTF2PSV0SWppu9Crm3
         onVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794445890; x=1795050690; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvLH80QhcDE1RiaDk2FJzwKTRJlmrkikJoyyX/2FYOM=;
        b=Xbenhs3MfEFI2SAIPWscHmic04EIkUtQVpHZsva08wmBaNx5ABWONMpTeBW04eVqT0
         k0s0KcST/p7jHgxiox/X6Sy8uNFMy/TrfEAEMFKl8TvPzVfAU3/IsnZHvojvleYk2LZp
         jsE1TTdbE0xT4PSQou2BKxbheS5kDVlg8iujj8pskWqRXmlHudiuLi3/NZ3bYUX4mXNA
         ocmcs997u2htpGKHo0QMSe1WVNuADhJZxSAETuFZRCFtaVmhjpJbD1SUqfxat4o1z/dx
         Wcqaus+D5B4YuaJe/Bocs8VtkITpzzranplSxaMN1QiItJHEXWBk8SNpMwPeOJ+n8L6h
         JLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794445890; x=1795050690;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xvLH80QhcDE1RiaDk2FJzwKTRJlmrkikJoyyX/2FYOM=;
        b=Z5ky2RPHdOvIbQegTmZQvWiigC+LL6DUDe+HW1yhXB8Tzf43GDRkCJxr02czf50O8A
         0S4LIWCZiLJpy6HeZMYR13EivEycriFTV/tAheuymiDxM0YCZpqYg2kL85QR68zmhIdg
         AV+dEbI3RjTMupnL2X5VT9lZeD94NcPX3l+E9GeUpgwmmItM50JiYj8n09xjTM2igw7n
         oVMpIR2OccMARzZcdFdMLYze8fiBWwkkfqF7qRsJQqFJbi/DI8dmX1IpLyTdRepRVi59
         R5H9DQSN/IZCaTus8IZrCIZaTkWtiK/z3kjOZCfg0xhIFO7oRsiG4vKHKqocbqQ4Pbk0
         tveg==
X-Forwarded-Encrypted: i=1; AL+hErFuD3ar1BJ7U3/6QDVfOTXsgML3oDU7dCUYwD+BQwmwUJc7iaLv0cIfakkYrA61Vt8tpXbOBByLC+ZaFw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z8R0Mi6gm9rwGydcWRv8Y/nHmN+j1ndf5xGvb0gltqL4vU5XJ
	XhwCIQXCNbuBFzKgWgxSREwOyLlwAIrZe/pdaVHwd7RGwAu9nl6bimKJL4ywpiDoEeWARRo9VVB
	oIFYX6qvSjY7zUogMmcSeg83WRP1RCNY=
X-Gm-Gg: AYBFou1dzs0j5mUKOC90eGbEDqPIxtqOp7K3w8JGREVnNd1R5GBcRMNwG+waWCC9evr
	CIwHiBJBxCuMjlpAlFtYF9d/pbuR3NJXDZ4uf7lcEaj34hUtYxwagb5AejRNgRjddcj/TMuojY3
	s+n9YVwiaHC33cw3l0/tJ1m/hT0p/lGl9ww3x8zkqkQumq5mZ1kb5PiBnVUvs0F3BiQz63+HVS7
	sVWyUwMOwbw6XMDHL85dQKOPrLoowjewcME98nSxalJ8ptwBpOra5MdHUD81D0dRRWd/GD4TjzZ
	Pz4R+KNTVMDPlbZywDtQ6Bjsw5N1/51RRp6v+WWKk7dXWX9RXLDDOx8aA0xFmiocjiy1SF1PG3e
	EjM41Zu3tx9mkYRBXR5LpC6J2kIjutbwKpa4PXb2AK5/3NhUAoPD+Who=
X-Received: by 2002:a05:622a:5446:b0:532:c181:8fe9 with SMTP id
 d75a77b69052e-556bd8fc8eamr66026521cf.9.1794445889503; Wed, 11 Nov 2026
 17:11:29 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: William MacKinnon <wh6cyy@gmail.com>
Date: Wed, 11 Nov 2026 20:11:19 -0500
X-Gm-Features: AclHuK92XBLs4pggJAPY-YHfAP27q3cqUycenuZdKtnP92jH0Ag3F1p0XKU6R4g
Message-ID: <CABWzDro3C8e5+7ajDRJ+iabbkROHLYSbWEKUpJ_t1ZT6DdTSuw@mail.gmail.com>
Subject: [REGRESSION] ALSA: hda/cs420x: MacBookPro11,3 internal speaker
 half-disabled by 8086:7270 quirk (82cfab6a5262)
To: Takashi Iwai <tiwai@suse.com>
Cc: Jonne Vuorela <jonne.vuorela@proton.me>, linux-sound@vger.kernel.org, 
	regressions@lists.linux.dev, Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"

Hi,

Since v7.3, the internal speakers on a MacBookPro11,3 (CS4208) sound quiet
and thin, with no bass. Headphones are fine. Bisected by inspection to:

  82cfab6a5262 ("ALSA: hda/cs420x: Add CS4208 fixup for MacBookAir 7,2")

#regzbot introduced: 82cfab6a5262

That commit maps PCI SSID 8086:7270 to CS4208_MAC_AUTO and, in
cs4208_mac_fixup_tbl, to CS4208_MBA6. 8086:7270 is a generic Intel
subsystem ID, not unique to the MacBookAir 7,2. This MacBookPro11,3 reports
the same PCI SSID on its HDA controller, so it now gets mba6_pincfgs:

  DMI:     MacBookPro11,3 (board Mac-2BD1B31983FE1663, firmware 478.0.0.0.0)
  00:1b.0  Intel 8 Series HDA [8086:8c20], Subsystem [8086:7270]
  Codec:   CS4208, vendor 0x10134208, subsystem 0x106b5e00, rev 0x100300

v7.2.15 (correct):
  CS4208: picked fixup  for codec SSID 106b:0000
  CS4208: picked fixup  for codec SSID 106b:5e00
  autoconfig for CS4208: line_outs=2 (0x12/0x13/0x0/0x0/0x0) type:speaker
  (plus Mic=0x18, Internal Mic=0x1c, dig-out=0x21)

v7.3.3 (Fedora 7.3.3-200.fc44):
  CS4208: picked fixup  for PCI SSID 8086:7270
  CS4208: picked fixup  for PCI SSID 8086:7270
  autoconfig for CS4208: line_outs=1 (0x12/0x0/0x0/0x0/0x0) type:speaker
  (only Internal Mic=0x1c; no 0x18, no dig-out)

On this machine the speaker uses two pins (0x12 + 0x13, assoc 1, seq 0/2).
The MBA6 table sets 0x13 to 0x500000f0, so half of the speaker path
(including the bass) is never driven. It also disables the external mic
jack and SPDIF:

  pin   init (BIOS)   driver (MBA6)
  0x13  0x90100112    0x500000f0
  0x18  0x00ab9040    0x43ab9030
  0x21  0x004be030    0x430000f0
  (0x10, 0x12 and 0x1c also differ; full tables below)

Forcing model=106b:5e00 or model=mbp11 via hwC0D0/modelname + reconfig did
not help: the Mac sub-table lookup still ends at PCI SSID 8086:7270.

Workaround confirmed: restoring the BIOS pins as user pin configs (HDA patch
file [pincfg] = init_pin_configs) brings back line_outs=2 and the speaker
sounds normal again.

Matching the MacBookAir 7,2 by something unique to it would avoid catching
other Macs that share 8086:7270. That could be its codec SSID (if it isn't
0x106b5e00), its DMI product name, or a check that only falls back to the PCI
SSID when the codec SSID is not an Apple one. This MBP's codec SSID
(106b:5e00) is Apple's, and before this commit it was matched by that.
Jonne, could you share the codec subsystem ID of the MacBookAir 7,2
(cat /sys/class/sound/hwC0D0/subsystem_id)?

I can test patches on the MacBookPro11,3.

Full pin configs on v7.3.3:

init_pin_configs     driver_pin_configs
0x10 0x002b4020      0x10 0x032120f0
0x11 0x400000f0      0x11 0x500000f0
0x12 0x90100110      0x12 0x90100010
0x13 0x90100112      0x13 0x500000f0
0x14 0x400000f0      0x14 0x500000f0
0x15 0x400000f0      0x15 0x770000f0
0x16 0x400000f0      0x16 0x770000f0
0x17 0x400000f0      0x17 0x430000f0
0x18 0x00ab9040      0x18 0x43ab9030
0x19 0x400000f0      0x19 0x770000f0
0x1a 0x400000f0      0x1a 0x770000f0
0x1b 0x400000f0      0x1b 0x770000f0
0x1c 0x90a60100      0x1c 0x90a00090
0x1d 0x400000f0      0x1d 0x500000f0
0x1e 0x400000f0      0x1e 0x500000f0
0x1f 0x400000f0      0x1f 0x500000f0
0x20 0x400000f0      0x20 0x500000f0
0x21 0x004be030      0x21 0x430000f0
0x22 0x400000f0      0x22 0x430000f0

Thanks,
Will MacKinnon
