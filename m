Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A92424D74
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 12:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029678; cv=pass; b=AC+kgvDucuKkfGEmaQIF3PXvxlAgpzXFhMm5XbuKsNrlKn5ICQefcO7NDKMWUlAoNWzGEYT9p1YowlAHy6X1Pj9iFXFbRbasECSOIotW5i9m5pxYzgQO1mnLO/w10P4WbrPgv9FHFRvjH/76sb/TTzc/qCuWLMV85VvR5MfVE+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029678; c=relaxed/simple;
	bh=GFVRIQScZEALLX4YfwLc6CT6N7maQ58QqBTwUAkoAnE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tH2gqDE5+EEX+hqn+T2Uq25wMMWb7bA8UcfVvXu61Rd5r29YjtH8CNe19O7TkLzgKYTOZ2rHrCSY2kYH6ELzSGYSQ2CK44IIyCwkB1M8PwsGf5vhzTJdWGe4CpBLCtwZjMo9vEtJiNhyb8MVYyS+9pT0QIc3hKCk3fZaqOvlJdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxVLybLS; arc=pass smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxVLybLS"
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5d9cd990aedso131756e0c.0
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 05:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791029668; cv=none;
        d=google.com; s=arc-20260327;
        b=cfR2XqZ8fGUUNMtStzJop3g6EipEbNUZebEipV35850t/vE30KLgMLn0GBZZzck8RF
         5XzNfM7BqEblgG1AXkNTAPKIzzCkJ8KQYDc8PEfFl1Hf1I53a0O+gpdjEHjArfVj3QMT
         09PAKw+AAzo74QUR68K8FkG9UBi/s9+ifra8oTeziXSdferxl4lDuC9MlK5MB2DNUrJz
         Z/4JZSTF4lygZlYlG2ijz+YKLBjLgvKwpuwOBZirgEs12MDwtAdOkV8kbrhmiDDfZN3r
         LLjS/gcu0qWXKIT47F4Z8qRDDSYWIGqDHCWuejnF7XsmWF6c0UDUAiM2WmnWFD/AiXXl
         IuQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=WzC+Vk9sR0NQIBcCByR1+2+KCm8LeYifUJRytDIvPeM=;
        fh=INEFzOJ0iDk7YnYDXYFJup7DKaFEJLGAPdnX59Z2XLk=;
        b=Pyw4H8tCiDqYRuMcWcO9U9UPcVUy4Dv3dRqGPAZHax/ezXzjBjhOpxLWArtVW5FvaX
         a5pCvwDNvFAExSARQg2PaqxsR5WNyBcdKvD+O4nLjKsxXcqt3N3c4yVDCpljaUZnuyWp
         KqRDWQAjLTFaCY5YwpFXQvL5o3z0c5Z/qxNqN/A73xqqRUuverLrtJsxwPs/0IBWMGd2
         jMXnaHK58y9xkHDT+kfp67wB7/0T2+0K0plcbbqpALd94zw+eNyUoi4CcTFT+W4ngw3f
         gRXmJRpuGmXz+XpwqXQAW44cvdcV4zqD4PK1dHM3gC0yW+Y0D2Lvmp8yOdYUGxvITMj9
         /P4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791029668; x=1791634468; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WzC+Vk9sR0NQIBcCByR1+2+KCm8LeYifUJRytDIvPeM=;
        b=LxVLybLSEhWYZSwj6JzsdtyK7cV7A6dcVLIH6sio0jL5WyywCeaV6vV8dtjdC4CI2Z
         ZNQ3RiEZrWE29dK5EZ1IZVWZaGCJ9q201HGf1LebpF4WIBa3OLWxZr21+Os8/rfDWm2A
         rrhlmLyJ4ZUAp1Vb98pjIund1AeQ1DImfA1Ml9cilrQ3mGbHZwR/Pzw/z5CaNpBjApHC
         i1Rb0hLAKwUhyNn27g3SYdIvtWsYi8bj/fEIeqe6pgNPTGWaZtnd/7QeHvAGkRXQkQAY
         Fj2HJrGDj93DFAAUVY9RbBZsnYEac9pjFZDiVLCiUwyjrZCYvb5cJ6Cxe+i/fMkKZhCD
         mniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791029668; x=1791634468;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WzC+Vk9sR0NQIBcCByR1+2+KCm8LeYifUJRytDIvPeM=;
        b=jjkKBbkcjg4w5TPte1VTVcgnyhKNa4YWFpvli/hjVv6KEcopLz90n5uYHERjhQcQ8h
         V459yTMSbkJ4JzTd+/Hn2KEzlFKBLPedgzC/xuF75puXHvNQ0Jddag+xEwmb0RmKjxDi
         NWo/aZkLtcBszq9yn6LruLoZWoIl1rFzXGuGn0pHCXSmefCLFjpVg66NHOq7WUWPQY2C
         KD6L4n9Nf5pc5BtOo3KT0dJBaPbKzrz14/q9LsIEtQBJbZQb2djhx7J0SPq867hm2MWT
         5hNWN+DBuez9bxR+rvoqfOUDtdINTluAr1PeW+yQYQmgNmi1IYsfL6iYXyGSQ49IEaNU
         siLw==
X-Gm-Message-State: AFq9FYJjOQ4tth+kR8TMvBQkjDA5Bs7EsSz0nFe9Kka/859BdwBvoOy1
	QZxL8G4UpVTYrMfN/E5ke71IvnepsIEdiqWe7Zl5MsbvBcD13zgdRtIlMZuFHdFpaMC6Ejf1i5J
	CvzzHJxNZVhuByXmVGUrQ+5loSXxDchw=
X-Gm-Gg: AYBFou3qMpnWlUgp6C7cJ2/Fbiq71PI7iXqThG16Cta/vjj/H/Fqa+iG3PSk7AteuCT
	OPH5vxGBuTdJyrFkXH7pWRo8QJhqCeAz9Xcun7m3Z0mRDajzqa97xdWrBGJmSAGVtYG2m0W4eKS
	KvupJ3s7rlHOrI/3dDP/cS1cwoGXAldo0Qhn6URNAER4UYpbdirdKxzpYa69K4iLlAqHDQdHReH
	hLLGtN9MBe9PEiUy3TO7mtf0Z6gRMk5aXoGF+umv1Z/o+8Vnxzu22kkeS5FRLkK6/U596iMBCcO
	xIsxGFzFrU1p2igZFzIQvTJWFioO3AcK/vUAvUDddZPVnje09J5p8Kw=
X-Received: by 2002:a05:6102:e11:b0:7bc:a714:2748 with SMTP id
 ada2fe7eead31-7c0f5bb03dfmr1133173137.33.1791029668371; Sat, 03 Oct 2026
 05:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Felipe Perucho <felipeperucho@gmail.com>
Date: Sat, 3 Oct 2026 14:14:16 +0200
X-Gm-Features: AclHuK_d2tiYzdfwJ40PuDi75LTxZ_KDbItbmT6bXyYhvggVNvMRJCsEgOslp2M
Message-ID: <CAA4VCRWSsgzinexpcHbY8TmvfkfzA3H_fP_5bUzNQXqfGp6QmA@mail.gmail.com>
Subject: ALSA: hda/realtek: HP Pavilion All-in-One 27-xa0xxx (103c:84ee) needs ALC225_FIXUP_HP_AIO_SPK
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

On the HP Pavilion All-in-One 27-xa0xxx (Realtek ALC225, PCI and codec
SSID 103c:84ee), the internal speakers are silent after a cold boot.
They start working after a suspend/resume cycle.

Comparing the codec state after cold boot and after resume, the only
difference is processing coefficient 0x10 of NID 0x20: it reads 0x0020
after cold boot and 0x0220 after resume. Writing 0x0220 with hda-verb
restores speaker output immediately, and applying these verbs at init
through a patch firmware file fixes it permanently:

  0x20 0x500 0x10
  0x20 0x400 0x220

This matches ALC225_FIXUP_HP_AIO_SPK, which mainline applies to the HP
Pavilion AiO 24 (103c:85ba). That quirk is not in my kernel yet
(Ubuntu 26.04, 7.0.0-38-generic), so model=103c:85ba had no effect
here, but the verbs are identical. Could you add an entry for this
machine, e.g.:

  HDA_CODEC_QUIRK(0x103c, 0x84ee, "HP Pavilion All-in-One 27-xa0xxx",
ALC225_FIXUP_HP_AIO_SPK),

Separately, the speakers pop audibly each time the codec enters or
leaves runtime power save. Setting power_save=0 avoids it.

Hardware details:
  Controller: Intel Cannon Lake PCH cAVS [8086:a348] (rev 10)
  Codec: Realtek ALC225, vendor 0x10ec0225, revision 0x100002
  Subsystem: 103c:84ee
  BIOS: F.27

Disclosure: I am not a kernel developer. I diagnosed this with the
help of an AI assistant (Claude Opus 5.5), which suggested the codec
dumps, the coefficient comparison and the existing quirk, and helped
me write this report. All commands were run and all results were
verified by me on this machine, including the permanent fix across
cold boots.

I am happy to test a patch.

Thanks,
Felipe
