Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795057269;
	b=jltvBdfmChpXjrC14Yn7078EkBEEVWtmAPKpebj/SHafPLJvE4iHdlN5tk5BN9n4lscM
	 1rXLK1powIBwmZP6k0kjEc9WMmnksDDxQLDUdv0mb87cO5xnlQu/CVI/GFEqLZDII/OwD
	 Dhu0GyZao7cw856FGI+0mQLVh8QLmg7deqRcvZltj47xB0MFb6D7qc31JaZ8KeNYgbkGN
	 iSXVsHMnDryrYeL9sMiNIJLkYY4y330mG9UeGrQxaM4zl0bTzg37rvP1ZBkd7+inBZCcM
	 tp2kL/5DsMKErXLahwhQARwF7y8vYGWOmOLwtVoPRbAZ+r3M6Qwo/KbsUQAFAVnGMCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=4w8GhN5mD7HSPr7/jRT4i69y1K7zgd/Fqk2kSujU6ZY=;
	b=skkydvjzZPs7jir3UrkU6A1OST3H6qxbkNeXQCeCicRmy/VVtqISj7xHVDoFNLkIPVuv
	 8gc+3zo+9OFDYKCRVfoU590FSjuMc9jmm5t1mFTUzdjk3kj29NNfN5YggdpVZCzLqNiLD
	 8LTgBUgzXvRRHmKHFVqPw6bN7JPv6MoGEEgUKVlGCECe2G/jJzY2hgX8mn0OFRTJ8duyy
	 tEdkMm9KssAlJThGQslGhphoHPALOAU8dpRIJ/bQczyppfNlq6PygU5gnpZEf04rHhS+e
	 HCVtf7l52LmAijCpFG4l8bKjaU2vJc+GWZGtFCAIDhNGahR3YadIF5FeOPCiftu88ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGyl57PS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C06860A2624
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 03:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C06860A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qGyl57PS
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so2723636c88.1
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:01:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795057268; cv=none;
        d=google.com; s=arc-20260327;
        b=d5zrYJcbmAsk7vFVf8HFZ+qJ35s9rb2QG8IZIZMVdt7IYNDc1mmLTIonlCaal+sRDe
         +mlZHe0enVGoX63y4WDurXEWVCTNTxKGugAb3mcjezlAO2e5bvMUgwnEyLJyBN0g9yg9
         ixy+KGRy6dzM77NpU3c4YMH/a6/PMNtu3ckXGMFi9MmOaAITLc4MMB5EB3twMi3DFsgs
         nXMOEEBktOU3gr0/VJO/APJ14WkInHGNz+1AR3RcelsFI6JBwgsAdH6Sidaz/ETYGBLo
         lmRVXMmTxDXxMwj8JfurQzmd0+fuwD+yaIQiMfA9WNZN2b/UTDe9O+7OtV8XDUFqAH0l
         rE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=4w8GhN5mD7HSPr7/jRT4i69y1K7zgd/Fqk2kSujU6ZY=;
        fh=hQZddDfU+2vFtR2bEfFZ2iHQF/2GxRgdUA4LudyjiZQ=;
        b=Ls/JsG+QtE/Lr3ezg/WW0OFcb/La+hZTgdu0yF0+373+6KgfdnhMwwUJDy9SUChiYE
         qNIx7FjLqHKAuur4NJfKtsw098OmRJmQ8C3SWM1ZtfYKJwzFDZQrr3T9Mm+pCAttu6mR
         lrYfu9G3ePfSp7dRAPmm2VxYM0D/SubJDbEE+0QGWXop1IalFPBweNhlv/e780cc9j7A
         3Ttv2sfbxVEkyDla3aPCLMIo7QG/6ASChAX3m+Mc7MI3B6feBQhQuRhJqLJZHIZatNae
         xzDynOVMP1GEtdObn1eOKB0VhkTmvBcIp+Z3Zwqx6R/KH55xrwoL2W476RZfzffpAHTf
         7nWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795057268; x=1795662068; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4w8GhN5mD7HSPr7/jRT4i69y1K7zgd/Fqk2kSujU6ZY=;
        b=qGyl57PSwCtsdthkmE8mGKl7E1ablioWbIPgus3WZwvaz358B4f7F3nMpH/9HSkSJh
         qI1FrOJhazuItFi/655BPj0IU+PPMhi2Rrqn8KlXDZKGlQSw97kymvhDkMBfwoaTDSH4
         IltQZh4JvV5dD5/ZgMzrAKHXk40kEUs0S2hqyORYzuWEYKCpD3y0Xp2EfBG2Qowh110Z
         Yk9pDfxcDjNd7CtAmSsJanK9KLRjwbZjuyhz3jacNllUAHB73PZ38QlFAFVhglh9kSZx
         XbLS2/meEcyIvwjFiNhSK6EQ/KMVXyk1FWeLiE5eJ6sACTfDEkgP8OSxulO/Po4KBw/4
         LYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795057268; x=1795662068;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4w8GhN5mD7HSPr7/jRT4i69y1K7zgd/Fqk2kSujU6ZY=;
        b=LcywjENyjvl+EijKxMv7BDqG1XRnZZSW5Sp1GYiBsEWcOyX9hSPd8tq5ynCUZ93wlj
         gNlV8Mtyo7/6tL16uru2FwEuaosUhsCfsO4P4Vul/PobgTouUM+TLBgvm4ruNAKWA50P
         cys82ObOkPpNFNfRj22iOSw+RdXNg5UOb80BEcimBvr9CFHHeMmHF5h09xv9yuv0R+KE
         krsiGnrFIvParPtZefoenUf6MqKh/8Ja/jMbYFhsO60Nk7LlDOlYIF449RHmS8kDvMOf
         2FhkH2GHMHYEBydgPae/zoUcD+B1AhTVpQ91fMQIybmd6mzdEnEzVglVRizKoJ1i+NAg
         JF8A==
X-Gm-Message-State: APuU4Z9ZGsR1bc9Bul7XXRJ/d3RD7Gbl1NeWgB7n968qtvSaGg8QESQz
	lMTWkAkC1HaN4sBlv+n2Fzye+4m7L1Evya6kV1wrUIIyE9iK1wv7FFu6kMouDp4xkEFzQgQWg/J
	+vIpKRuZ9n9Bln/6C1yM7Bb9WyhpUkpMNGrBldLE=
X-Gm-Gg: AYBFou0FW+3Vx2VxDNy5yws7wG1h8zHZBEULnaV6aPj9WOVXbQdJZxfIj+8h7faoUNz
	56GXJY4W6/996+lFmDqeu0PenAAf8kcKgmWZ+EJlP5uaQKRH+iKiBKsOiKDE+GUSlmnYl2jLaXs
	5GlCOTg8SyQRsd9Nj2OL1/jNpqKlzLBebom0btd1UwMcCpwI1oBqeYDKtgc6f0QpRxHJcNCmpKh
	GSTtGVfIoJZ2/ezXc8TqKAvgYjNdmLZteyKrdYtkzvPdUmFOL/cT8FhKoqzhgkkc2+avu3wXYUW
	Deo2VpUPUbTsRbShbLmzOhkeRBG7cN7emXYmGN81ZSmLrAkbG/Ggghf6BAeUhQhE2kaspVlB2T1
	uUvSyYLej5wbNmYnAskvQiRXxUkAnx0/LOGtWWdZdKoFm/+nq+Yen4JF8DdavXt1anNRIcjkDq2
	eaKZaT2zjR8wFLEaIJjbJnNgPp8At1/EoK7OHad99AyidzxJvztxd6rPvYgzsoW1k49brbX13V9
	cX5XgEvbn862vtr1xYNLxSWp9SDMjI+miWfbYhc9MmJ0nAgpXhcnPJcwLjsaGJs6iVlyOW/7wca
	5+E=
X-Received: by 2002:a05:7022:f51b:b0:18d:9eec:e0be with SMTP id
 a92af1059eb24-1b543af02d5mr3572408c88.2.1795057268368; Wed, 18 Nov 2026
 19:01:08 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Jeremy Bryan Smith <helamonster@gmail.com>
Date: Thu, 19 Nov 2026 03:00:54 +0000
X-Gm-Features: AclHuK9nXomkhmMPmwPPA7MC9ZvJFm-hb8h2R8UJUevCW9DF2BMhpq2yU1eWGPs
Message-ID: <CAAk_qkgY_To5dwBgua8NBpUv7YWB6g1w5b2g6+BzQ5=mqgq6dA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Rename Line Out control to
 Headphone on ThinkPad X1 Carbon 6th
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de, perex@perex.cz, zhangheng@kylinos.cn, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[REGRESSION]

Hi,

On a Lenovo ThinkPad X1 Carbon 6th (20KH002RUS, PCI SSID 17aa:225c,
ALC285), the speaker and mic-mute LEDs stopped tracking mute state after
upgrading to Ubuntu 26.10 kernel 7.3.0-10-generic. The mute keys and ALSA
switches work, but both /sys/class/sound/ctl-led/speaker/card0/list and
/sys/class/sound/ctl-led/mic/card0/list are empty.

Both LEDs follow the mute state after manual attachment:

  printf '%s' 'numid=11' > /sys/class/sound/ctl-led/speaker/card0/attach
  printf '%s' 'numid=7'  > /sys/class/sound/ctl-led/mic/card0/attach

Commit 108704eecab9 ("ALSA: hda/realtek: Rename Line Out control to
Headphone on ThinkPad X1 Carbon 6th") adds ALC285_LENOVO_DAC_RENAME for
17aa:225c. That fixup is not chained to ALC269_FIXUP_THINKPAD_ACPI, so
snd_hda_gen_add_mute_led_cdev() and snd_hda_gen_add_micmute_led_cdev() are
no longer applied through the old pin fixup.

Chaining ALC285_LENOVO_DAC_RENAME to ALC269_FIXUP_THINKPAD_ACPI, while
keeping the rename at HDA_FIXUP_ACT_BUILD, looks like the likely fix.

Full diagnostics are available at:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2174970

Please advise.

Regards,

Jeremy Bryan Smith
