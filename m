Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422617;
	b=tI8mit2mqyg+7I+fxnr4/SiD/1LxQyLz7vk/2gkcLMFz/tgTjwcr0P+Gkv7q4JXYRQD2
	 b+EIduwXO7Czy97JWkP1+sCL9Yrh8jXWJBvaeFHDusn3u/AFVMRpe4YbBypZ9/BQudhI/
	 zbBqEc4xFpSgo2ob10oRPUTkecOeiTyd+ra5cUkBwwJx3hJkMPDCShjeY5thGw3B9ab13
	 sg/Cy501/OKHsefgLBkisq3+arBvdb8XQ4q1ghYqTK+hCGg45+JM3oNrwmEcLzwn38f1w
	 Wi2Ay8H26kYkJMI67WIu0PD2AR1pGGR8QEZqvZa8P/Yzc5SmbVt8SQZ5omipg2Lnkcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=HF0ZaQFZtpES7I3ketM+dRHHQj/moZ8rhgorfDfzl0M=;
	b=p2ozBNaVqPxazFYW+lMBHkrtfhPeX63b59rl3C1/VGQ6Cq3REifpQGbLOqjPQ3dJJYht
	 X45HVa1w+GJDRM0Asqj9Homs9yIoTTIpAfkXFXuijTqvR1+moQM1edJ+8BAUkIYLmrVSz
	 Y/HtAIEsyOG+VXE2kL/6ik9+fQI2j2aXJU+NFXKzfuqSjhR2l9M4ZXknvwkM+RJOiPrvU
	 ZB+6NYauyK9pVBcLsBTGmtnatTkE7ezBO//fgGEEPdP/uKuLj9j9GAbmmMcqKfMvQ5L9u
	 3sbVR3iVMnPoEg7EKieBmR7PeZVivlgW5auaT6tweDrzXa25odeTbPQiz8VMhE7gRng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VknPuHZe;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059F3606A33B
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 08:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 059F3606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VknPuHZe
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f05b465cd1so11226345ad.3
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 00:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795422616; x=1796027416; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HF0ZaQFZtpES7I3ketM+dRHHQj/moZ8rhgorfDfzl0M=;
        b=VknPuHZeBan9vuXv4QoNpnRq12ONg1CjthfuSnY/LaF/GKDSUEkAtbpucunqBxlrKg
         HvBQJvJjkQtl26WUyvC/HmkROnpBsHSyRt5y7XZM8NYNxbF9pxsIHTN2JAoYzsidzXTX
         TfAhg5woEmBVSZ0PO+BIAGOvohMOlo9BJAnPr7BjUzyWRb7dmNorvfkNC58cGG697G5u
         MdhCbhO1Yz8GsLQ26CIoWhlKga3cqjevvJOgntVzNFd/wWhH4vihEU/ruAXVS1WKxUrq
         9kME4c7E3g6/U3lrqxt3DGHnshmtFKj05lAPJ6Mki3gD/Ho1QJIo11Iwb212DuytIeFI
         YiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795422616; x=1796027416;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HF0ZaQFZtpES7I3ketM+dRHHQj/moZ8rhgorfDfzl0M=;
        b=BzULsoC5RQ8/4uoESzKfej/t+l0JbPwmwphysgJBh6hvqHSqugDAaLT6tDR0kPjK6y
         EwV4Qjwh9vDwDifR5oFNs4ku8ayN9XBiSftKcDB/R6i+v2nyhLDsWl2+GzvTDcXt5EtL
         ZYlplJSLGT9qqUbxPMF/beoTbm0WDH48hjcbRHms8E109NODk7BmtGPRV7YhBinEA6bi
         7qtFPUvYvWKhmkwX2tfTRYZdkqs92UREJI+8cliwsPfcT684TazHByyG8N/uWsMHnNmF
         bKXhFNawfbWUjraVXJ6JXWL3o2Mmx25eMe8+XmB0/CK2m5ZkxeVOJBb5cYpyQmGhOjW5
         DMlw==
X-Forwarded-Encrypted: i=1; AL+hErGiiMLMzgXbfDs4Ii5Zeo3Y+OfOPDJwlGpzK8i4Ls82dt/SU1ncgQ3rAoPYfoeHBC5GcmbkvUod+fW+IQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9sqfhokHDHdpYZtZAy1gGX6qK0QM+9bVY/1bunNU+Ca4dDeIvx
	zGb/T/qkN7YgcpmBf4tix7grcM0s0EnjKUQiGVt0jB35cVg6as3+N5or
X-Gm-Gg: AZFdTZdwMlCGfyE3LRi6x6eDu0Sp2wa0vU8bX0hKkgDA1yLa8GfUhGc6s52bslqLHX9
	MXDnxk4I+duiSzkhSx887If8yW40XqHokwQcVfqD/g+kvXqhJUgsyCw7xNSdv/34rYUS8cqA1jf
	l6YMB+IwfVO9EK6dJLmN2wPp2CqRZiUf7jbsQ9pRk5LE2Yo+ts5aO8UfLjkpkOwPeBWFKKJU/TD
	npHhYXQ43s5NV0OQHMmg0baG8d0bJfL/7zxjPxViaUfulfIigff2XUgtogRVXLVN/kVXK5q1bSM
	JkUUCzgmKxWEDDKRjwBHAExbXE+N/u1RDXy3vIjrxNc9qItt8GQTod/5YLiW2pI4vsPAsS/QX0I
	ywSq0pVp0rPNJ79k2Pl/Fdo8cEtF1/mcPZWWQjr3UofAcJiVmTgKmgs8HBJKX62H9SY0tY0oy7G
	DGXfXyYXVX4CxnUxKA72NOTz3xar64Aa0egaAUs+E8oaS6phtP9JIsk+dBvKXw4xSNHQm5q1OWY
	/3Zo7P2l4P9mH0IpbywasD4a48EnlDlfgqKv4n8oxOcFR91QLD+X7eA5LiW77yTsp/+4LeC/JM/
	dVu9iVIcMb+vO0cPg8FoCZJf/8YERBnmVAoO42bKlSpVBNf/FIyJ39ee1yWJ
X-Received: by 2002:a17:902:f544:b0:2f0:8fee:c878 with SMTP id d9443c01a7336-2f08feec93bmr28221845ad.8.1795422616276;
        Mon, 23 Nov 2026 00:30:16 -0800 (PST)
Received: from localhost (211-23-53-87.hinet-ip.hinet.net. [211.23.53.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f08164dacbsm19643025ad.68.2026.11.23.00.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:30:15 -0800 (PST)
From: Yu-Hsiang Tseng <asas1asas200@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Cristian-Marian Fotache <cristianmarianfotache@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, perex@perex.cz, linux-sound@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [REGRESSION] ALSA: hda/realtek: Higole F9B fixup breaks speakers
 on unrelated Apollo Lake laptop (10ec:111e)
Date: Mon, 23 Nov 2026 16:30:13 +0800
Message-ID: <179542261324.542908.13953751300676446171@gmail.com>
In-Reply-To: <87pkvx5625.wl-tiwai@suse.de>
References:
 <CACGjpbf73XdwrG34ffjmYU3ZYuStPpFNXf9w+AGYcTmLyHCN_w@mail.gmail.com>
 <87cxrx70qe.wl-tiwai@suse.de> <87pkvx5625.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, 22 Nov 2026 14:50:10 +0100, Takashi Iwai wrote:
> > Yu-Hsiang, could you check whether the quirk can be replaced with
> > HDA_QUIRK_ENTRY() with the codec ID instead?
>
> Correction: here I meant "codec SSID", of course.

Sorry for the breakage. The codec SSID doesn't help, unfortunately:
it is 0x10ec111e on both machines. Cristian's codec dumps show
"Subsystem Id: 0x10ec111e", the same as on the F9B, so an
HDA_CODEC_QUIRK() entry would still match his laptop.

Please go ahead with the revert.

The commit is in 7.3 and was backported to 6.1.y, 6.6.y, 6.12.y,
6.18.y and 7.2.y, so the revert will need Cc: stable.

For the record, this is how the fixup silences his speakers. His BIOS
declares two internal speaker pins, 0x1a and 0x14, besides the
headphone on 0x15. Without the fixup, the headphone gets DAC 0x02 and
both speaker pins get DAC 0x03. With it, 0x14 can only use mixer 0x0c,
so it shares DAC 0x02 with the headphone. That DAC holds "Headphone
Playback Volume", and PipeWire turns it all the way down while the
speaker is the active output.

Also, pin 0x14 on his laptop follows its connection select, which is
not what I saw on the F9B. I'll re-check the F9B before proposing a
narrower match, and I'll Cc Cristian so he can test it.

Cristian, thanks for the report and the dumps.

Thanks,
Yu-Hsiang
