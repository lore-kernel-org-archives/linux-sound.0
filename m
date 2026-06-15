Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDFF21D3CC
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 00:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781483307; cv=none; b=s4biCc+gsytGIC/46WPbC0XXrUM3EZMyPF9R+2s+08ccVMbX/nQJCH1KKuVFyyubyoyux/JSM4eaLFYvvHnKK1QBTjOU2YsMnJhoaWb5VgmJGM+dkqE8f9+UN9A67iyUFjNaz9UCQ9zwJNQX4WdXP+/CA6Sq2b80iV70iL35eac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781483307; c=relaxed/simple;
	bh=CjfSUv8Gnt//hqb51MR1rfGU1wtEycgRWQdqTGJ/GSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdsFjoaqbkcANcGBGrkacIEjQGZDecQQqtwQzIHNbMzjLZd5zQZl+Cr3tCFy6Tk+hJYCAQFJLQ+C5YEoIVZD6WyL4Hewlkmd3cnuOQydUQiVJDvzHiwpAptEoMcABe5vFEMlt4duaCVTlNaxz5CXU2dx4bMxOpeqCFqDhuzhTzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=RNiqDCpx; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="RNiqDCpx"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef82204c6so1376921f8f.3
        for <linux-sound@vger.kernel.org>; Sun, 14 Jun 2026 17:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781483304; x=1782088104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDgsO9WAhB4kSub3ESlC/5e/13+sNbJxJKK0iJK8XAc=;
        b=RNiqDCpxU4+edAm3ntkDkTEqgxnhA1iqPsjsaP+8DFhie9QKRq6uXQc/+FJKsOpTkW
         Ok/a9WE0XLvEUBTXOnEMA58BJ2Yt5+EPKLrxeaRogkrmIu8OjoOKuIETqF9L3gl0bhaz
         ENIe+2mI0pPY+r57Pbm9qWF1ClLplRhbAtGlUNjb+olHyFIriBLxAKdGfOj4WSStHS5k
         BgGzYmy7qL9sX9HTeOHS2dlLl5Oq5W2dbqNtoKidaD/ZHzFEu6QFnwQJ/Tq1ytOEFD3H
         +OI91J/dJ15LZ0XQd+bzuzRtBVG97gJajCZiBtWLbVppEVVkegugcgUs7ii2P0+YVMDo
         3x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781483304; x=1782088104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qDgsO9WAhB4kSub3ESlC/5e/13+sNbJxJKK0iJK8XAc=;
        b=nxIP99vrWWqVls87eeYDhCkuYzwufIJLfuejj36gyWgUMgph8wK7WxHNthiiPJCAe3
         WlEgRVzHIwtyaIbrTKHZ1UAiL6IDmo2BQd2zE3v0XKItm5LuFF017ddemrGxFODJoyIN
         rOglEIo9gqLMjo18AS3aTIBTRUXyc5zi3uBEaSyA5QljD/VheQ3rKqHJedGOplmXFRoe
         Q7dpqSRAAj8dtkGQeb4pa2kRhqncxls0bH+0d0ciBR+UXOnCms26XGx/v2qemqn8syTU
         GRoiVyxJ8G+ymepH50N72TyUTE0UonEailEz/IipAj4BqFMPmyrQIXJQCa2ZP6fFxGDx
         TW4g==
X-Forwarded-Encrypted: i=1; AFNElJ+bArCM67PXOTPNn9u7QG8dvfJXW9p+orTKc6RHnXqPDrFkkzuspUgBSylVbzPJlFYSGRMKUE9BUmieug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ2Mn2tLsKzEs9vw39NKaw5wjvLuE2zNyi0InrKt13E2oQTS4w
	lNl4ZXGKMxdEJhQiQ5vC+DxehsllVmdb1ceI9MuwCFgoDHeTVVdlQISeKfZFI6EvpHSS
X-Gm-Gg: Acq92OFlo6JLBq8Y85QTv20jqFYY+yObE6tZxGiuSbCfmcwk5A4+cJBhBnaAIt4itbe
	HqrjpeIDzGokE1oH3h4ZsQZKNAl+JdbkkuzD6hxlpzNSBECt81WkuDlnsHcbAEeDO3Jv3fQmC/E
	fL5WCgSTpCxNUns8DD4dEsCMssV19IsfISTCms76riSR5bmokuQVALJ6yghFwQljTb71uf/dWJF
	9N/xlzXF5xvdTVpKi8ROKLNyM5Zum7UtSDZ6ersfrLcIqR+hZNfqw4ZM3LCXv37+19QBhQCvcGa
	baLoPMMNdTSEPO53skOQCNbwbkdBDpF3nuIl7YeSqQXacatt/VTjngZj0FQ1UWYpf8IIdcdZEBT
	301RYd7ZW6wAHq1IG5tR4F3McFXTjiKgS6XFRh61M1NtKwmsLcz6rG/be/ERMGUZPGAhAo8uMFl
	TU7R0v+Kitnj6Y5gkUy0cfAFAsPjcDvQlAZS0tlr72Tl2vALO572XlecRCfLdipFdnH0e9Urich
	ghYOhsMrmcS2MScxs/vIYDM2AJmQPVgto4PCKTGytKQKg==
X-Received: by 2002:a05:6000:46cd:b0:43d:68ad:3b7f with SMTP id ffacd0b85a97d-4606db988e8mr11754887f8f.21.1781483304570;
        Sun, 14 Jun 2026 17:28:24 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f23fsm28901275f8f.9.2026.06.14.17.28.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 17:28:23 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: tiwai@suse.de
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: seq: fix use-after-free of borrowed substream in snd-seq-midi
Date: Mon, 15 Jun 2026 02:28:21 +0200
Message-ID: <20260615002821.47317-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87pl1xk06z.wl-tiwai@suse.de>
References: <87pl1xk06z.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 11 Jun 2026, Takashi Iwai wrote:
> There has been already a similar fix queued in sound.git tree for-next
> branch:
> ef7607ab1c8adc6258fb1b27d08e26aecdc18a58
>     ALSA: seq: midi: Serialize output teardown with event_input
>
> I believe this already addressed the bug.
>
> Let me know if there is still anything missing.

Hi Takashi,

Thanks for checking, and you're right -- ef7607ab1c8a ("ALSA: seq: midi:
Serialize output teardown with event_input") addresses the same race my
patch targeted: event_process_midi() borrowing msynth->output_rfile.output
while a concurrent midisynth_unuse() releases the rawmidi file and frees
substream->runtime before snd_rawmidi_kernel_write1() pins the runtime
buffer. That commit serializes the output_rfile publish/clear and pairs the
output snapshot with an in-flight reference, which closes the window, so my
patch is redundant.

Please drop mine; nothing further needed. Thanks!

Doruk
