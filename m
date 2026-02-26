Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FC4332EB3
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772103737; cv=none; b=hu3tgFmeqJURG2TopJkuQvjV+GZXoIyC614CQuAQignJeASDNMlEyEaCAYSE93oSUHvLJb0QBxsiXSBsFAMdEEG5DCRgaVbwelglHpxVEoHy0RPSX7fUdTScYCLfDjRynrFxopfX42yNwBondVXz4PhikBkMu5UJyo7B/Dp564I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772103737; c=relaxed/simple;
	bh=5z6y+07v+WcVs/ZbSFLl7bybYGXo/hAlTXRRbBhPDo8=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=ON2lh9u++JITtT1qUvrB+q2CkkhXmWVi3uaPRQtxBoX2jGzCa3FbrUty0rHO38k+dB8PoHo2J3pRR6SbD4oOsMW7YYPiQVuXDsLljqJkg2MAEiiv2ZOTJnBnkCfrHwF8sfu6go6IYWwvWQXMz/Zyxovm1/Z6tmv0XM+2jFaC6x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UO7pGF/M; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UO7pGF/M"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43767807cf3so485857f8f.1
        for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 03:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772103732; x=1772708532; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:mime-version:subject
         :message-id:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HyupJta61A5mG8jClmmqqmQL4uxhUxk1UNpsxKTM+NA=;
        b=UO7pGF/MO0RVTH0wBIGQ9lrqDgSjJSuaEw/gS6qygCyXc4cUmMmDrzmLF1qUMRdqb9
         QumfAEv69pNDEnQqtt3MRUbO6rGf+E6l9H+uiuA2Fz7vZFHUgFoGzCu57TfbvjKDHln4
         6/5B3aX61HaHrqezuQzHHps6NJyVkVDDZeDvfN44SKqScD2SidEF3v709WLQe7jx9xM3
         BervWFHPixl6j7mfHi9uYtf+cC/OHE4MN8vwrPvH7ZnzWBliToI9Qg5yFztM3W0lb7J6
         CJ8BQAS/HWzpAmuHJiJW/aUwHD/PYqFOW4xRFoHoULmdM1fjIUlV5KPAWl/LkpeNtAbP
         rUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772103732; x=1772708532;
        h=content-disposition:content-transfer-encoding:mime-version:subject
         :message-id:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HyupJta61A5mG8jClmmqqmQL4uxhUxk1UNpsxKTM+NA=;
        b=hLEiw/KPOp1PL9wnOQCylvymp66PPKj+9qdU+4a5lXdXhBz3k5i8MG8q6kjDyFua78
         WnYbX1ZwCUuHA5Gp/Vb34jpK33maO15bzEMbYC1SiU1fu4hkQxEnhFCigL3X8fFm5Yik
         8fB4EwtbHE3Od7q8I46LB98h4EYNXR4CiFGvRXd1BfHabBeML3voC0KS+rzdvxnbH4wl
         JPpAXEPeGghRhLcJRtp0eNNRxXhEQdypNNvWD4uOghWXvdLwaB0LDfGFz34YnczBNeFl
         vohvgOef4wKOwW/d5BseD96RYs58cs9lANBETd9QOrpMhRlRT3ihfKqmCVtAm16TYsIE
         SrAg==
X-Gm-Message-State: AOJu0Ywf+q3uUWtCMV5dWs20vMuC9032iG2gp8FF4zjnJ2XOcAiBht+f
	go0FUV3XXwmPPI1Nr9vdYpqMpf29BFu7EmNH3UB9lIicm72w5brVAhNadpxtaCDf
X-Gm-Gg: ATEYQzw8S9o8Irc5RCeUGMfAl8uFi1nQRy3UrrlvACjylq3vJ7o6iAALJh1Z/n3kBqZ
	0d2nt+2Wm2hGStfHX4v6yOOpc5lPCUZSy4FbIKDkFqn2zCAdM8WoCzrH0idmcZ1B1+vE44nQ4uL
	RWQ8EkDesZu4D7KVaQhO38tD0lNEcnuF/mIrAgImbyhYGZfLBlIIG74hIzy8TIB2EK/nmC9lmNn
	UaNLu4d1sPdLF78kN0PbHyc+YPs/pqO/6169B+83Rr9iZu3W/z77hT1t/4bbdP70WPF9FD/cjS5
	ec51t6VO+yY7bA85O1AOC1lawNmRO/frLG32jSsMumOtYKlhYs9F9nqf1oQjjZIbCtFwHVdlc5h
	Mc47D2V0XQ7mvv0AiXboHU4woy2TI/+ngj2TDwrD5ZZeIrr+L0Dbvlm0MJSysLVkOhYhdwDkqFV
	9xZiw1XtKqKb5b
X-Received: by 2002:a5d:5888:0:b0:435:8aa1:ff4d with SMTP id ffacd0b85a97d-439942ac98bmr7110442f8f.22.1772103731855;
        Thu, 26 Feb 2026 03:02:11 -0800 (PST)
Received: from portable ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm40377700f8f.31.2026.02.26.03.02.11
        for <linux-sound@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Feb 2026 03:02:11 -0800 (PST)
Date: Thu, 26 Feb 2026 11:02:10 +0000
From: Phil Willoughby <willerz@gmail.com>
To: "=?utf-8?Q?linux-sound=40vger.kernel.org?="
 <linux-sound@vger.kernel.org>
Message-ID: <F1B104A5-CD6A-4A26-AB46-14BF233C0579@getmailspring.com>
Subject: USB device with more than 32 channels
X-Mailer: Mailspring
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

There's a check at sound/usb/mixer.c:2024 introduced by patch
2f38cf730caedaeacdefb7ff35b0a3c1168117f9 which filters out any device
with more than 32 channels.

My audio interface has 34 channels in and 34 channels out, which
therefore takes this branch, and means that this interface doesn't work
on Linux. As I have nothing plugged in to channels 33 and 34 I am
locally experimenting with changing the body of this check like:

-		return -EINVAL;
+		channels = 32;

Which is obviously not a change I want to suggest for general
consumption. I would like to fix it properly.

Judging by the commit message for
2f38cf730caedaeacdefb7ff35b0a3c1168117f9 the only reason for more than
32 channels existing that seems to have been considered at the time was
a malformed USB descriptor. Is that something that actually exists in
the wild or was this scenario purely theoretical?

In either case I think the core of the correct fix is going to be to
make the 32-bit variable we're shifting a 64-bit variable and change the
hard check to > 64. If there are real concerns with malformed
descriptors we can either add an allow-list or reject-list based on vid/pid.

Should I expect any ABI problems here? Are we exposing a 32-bit channel
bitfield outside of kernel-space anywhere?

Some background:

The interface I have is an Arturia Audiofuse 16Rig. Yes it really has
that many channels.

There are a few threads on sites like
https://linuxmusicians.com/viewtopic.php?t=28759 where others have
encountered this problem so it's not just me.

You will find some threads which say it worked at some point in time but
then stopped working - this very roughly tracks with the timing of the
2f38cf730caedaeacdefb7ff35b0a3c1168117f9 commit getting merged into
mainstream distros.

I think I'm the first person to try tweaking this piece of code. I'm
still building my patched kernel as I type this so I can't yet say
whether it works.
