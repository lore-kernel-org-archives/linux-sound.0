Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B9229B781;
	Mon, 22 Jun 2026 17:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782150214; cv=none; b=eJzRDbubsN5RKAFm7DKHMJldgcjP3Azoz6EzURPYp7oYkPSUO8xJwM/seo8GL96x9ECnT9qB1N4AOZQ0H4qaG0dW/JCdfifM5mVdAxkuGaoe1TtMJC97PLrgauvQeE95M8k2KFK6goDMlOFvrvgq0R1Fvfxns4Jkubdww95bO74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782150214; c=relaxed/simple;
	bh=MzCR6hEXdCWsSEMqgd8Zt/pp39zV9rJ071qiugek67U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/vx3BBH/9t/AFrmQ5XSUc1NYDlfxhCuALYq9bl94BcsjeOpOL11Z7H4fuDJRGG5xwv9P3xKjUnksBDwf4nMvXA0sBEyE7otFPffVLJYKFCSEAgWvhTMLsU77WBnjh6b1fNmkhUa9OnXnEo7WYUooOZGw5tU/FLpWwfSlG2UnCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=christopher-hoener@web.de header.b=pitd5Tva; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=christopher-hoener@web.de header.b="pitd5Tva"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1782150203; x=1782755003;
	i=christopher-hoener@web.de;
	bh=MzCR6hEXdCWsSEMqgd8Zt/pp39zV9rJ071qiugek67U=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pitd5TvamwaYvvHBG8Kj+a74E5Uc5x8lV61/ONWe8yuwhI7LdrOzAtJKFI6PiXpz
	 9GB6zOa9ULN2rmdNl/brK+voGl8W06MCi1Z8g20bdNsHI4LbbEqaOJBUWHOp2tkwt
	 l8qTzDBIPU+0q0TLGH99RQt+F5aoyyYCSTrDG7Z/mjDt4FCLdIDLxbEBRHLWiE3dv
	 My8xgIYjgWSIHSVD5Gli82ykUGVc/YXAh33ahFh1wbowHSz4WosWis+/Vv8lD8YCV
	 7dN5gZk0KBlR+x8JfW72Qdk5nbx/888n7aZsFiqftrUSedv7gJ5OxDqxPuVse90Mj
	 LreRv+DcfeOcoXrJlw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mpl4z-1wwR1i1ePN-00gifC; Mon, 22
 Jun 2026 19:43:23 +0200
From: =?UTF-8?q?Christopher=20H=C3=B6ner?= <christopher-hoener@web.de>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable internal speakers on Razer Blade 16 (2025)
Date: Mon, 22 Jun 2026 19:43:09 +0200
Message-ID: <20260622174309.5873-1-christopher-hoener@web.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87ldc7dkdx.wl-tiwai@suse.de>
References: <87ldc7dkdx.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:A5fEvQ/S/ln2/V52icEUAjq//6xT6kGgBSqcuuAToaWnXv4k9NQ
 B1+0NtaI+qpEE6Bjhei78sWKp3zutgmgq+3PsKfDdemJzMWObNzFtTlAiO5equEohfB+A1N
 5eZzJU4hYbbYVS15j9im4jeqLKokxs+3p4unNhrmQkflG2/5p+1Gjeu3MKQoN/1BLzLLHpC
 TWFeYQYAeIlMU/wYjhSYQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PbOKh09zs7M=;l3W8cfd2fac47b5jsxv9pl5BnAC
 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

Hi Takashi,

Thanks for the review.

On the size: agreed, that was too much to sit inline. v3 moves the
captured DSP tables into a separate header (alc298_rb16_2025.h) that the
codec includes, so alc269.c keeps only the apply helper, the PCM hook
and the fixup.

On power_save_node: I tried it and it does work. The catch is that the
amp wake and park have to come out of the init sequence first, the park
in particular. If the amp is parked at the end of init, nothing wakes it
again, since power_save_node only toggles the codec's own widgets and the
amp isn't one of them; it sits behind the coef mailbox on NID 0x20 and
isn't a power-managed node. Dropping the init wake as well seemed fine
here, though I'm less sure about that one, since the Windows driver does
send a wake at init.

With the amp left on and power_save_node handling the widget PM, playback
is fine. The one thing I noticed is that every stream then starts with a
small but audible click, the speaker DAC and pin going D3->D0 in a single
step. The mailbox wake/park ramps the amp up and down instead, so the
hook path doesn't click, and for me that transition is the nicer result.

The trade-offs run the other way too. power_save_node would let the codec
power its widgets down when idle, which on a laptop is probably worth
having, and I can't really put a number on what the hook costs by leaving
them up, so I'm not weighing that part heavily. The fact that it's
codec-wide is presumably a good thing for the headphone and the mics too;
I don't know that side well enough to have a strong opinion there.

Where I landed for v3 was the pcm_playback_hook with power_save_node left
at its default, mostly for the cleaner transition, and because it matches
the other ALC298 external-amp fixups: Samsung and LG Gram both drive the
amp from a pcm_playback_hook and leave power_save_node alone,
alc274_fixup_bind_dacs sets it to 0, and alc_fixup_tpt440_dock sets it to
0 specifically to avoid click noises.

That said, you've seen far more of these than I have, and I don't have a
strong stake in the PM side beyond that transition. If you'd rather this
used power_save_node, say so and I'll switch v3 over: drop the wake/park
and let the widgets manage themselves.

Thanks,
Christopher
