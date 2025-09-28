Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E48280CD2
	for <linux-sound@vger.kernel.org>; Sun, 28 Sep 2025 11:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759059473; cv=none; b=BXseKvbNiCgeWeGHXH5oPbyEotiAkkSo1tCfLf9fwOtkElY7ryygXXaA6BTkvNjeqLamJ9OnhiJKxxGAGZjTXfmPtgICh6fpMiqC6u0Lid/RVeLf2T+jCQjV9Td5GMKkNFklj/XbKWG1CVmNMv5YiSvfz8Gu9QFO438xwkTNgvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759059473; c=relaxed/simple;
	bh=vogV4tufCCY/DMcX0HaunnStGZQjgPbWKsq88oPgwSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l45zOiNJJTOGOp2ygfFXa6czcCfs/5U34QQAWw9oRHL/CAfOKR3N5JAtKE1Hg+S3vyi0ZJs+RZivfXB7lHbn77WUtHbMB9i+p1Y1naSLo3EE15gs9tV67NFBdKfC5xv/YeoXZ4CTdAnh5S29P3MXVenNwLjs/Xq6u2a/M0GgijU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+dFKyrc; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+dFKyrc"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57b35e176dbso4566006e87.1
        for <linux-sound@vger.kernel.org>; Sun, 28 Sep 2025 04:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759059467; x=1759664267; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNIcsaK13+2fEe0PCU9S6Ng1JJ03HR/vVp5Ix6ijqWE=;
        b=G+dFKyrc0kv1qkBxtcvw6oidBpn4kBuVpsstQTWihB8nK2i0+rHZtzfjMLFAX0za+r
         vEPvliXNTsPozYdpr7f6EDGDkSEurCMj9MuRYFM8saoaSv9eLbYpHJFDm1X1+fNgGeqn
         63Oh7qvMbajOWG8Dbd+AlSgCgpxDSr+et0dcXLwG2DiHr0z8j5isLLartBtEHjCKsw3W
         C+xB7YuWIvHmoylsG+tS9B3ja1rwKB2LoHU59FFlKBeko3e7NhhSxR825TdtKQPwD5Sp
         bYSItF96xeZstMkAwoSOIzJg5kgX/xpx78QV73VwTfUsJsOOwSjrSyyG6w2X+rfOJVfE
         yggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759059467; x=1759664267;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNIcsaK13+2fEe0PCU9S6Ng1JJ03HR/vVp5Ix6ijqWE=;
        b=KOcEXNJXjnRNt3BQM7Jt6zY9PZQduaLTS7y7Gl9sTDWWCCliLdTSabQL+Xi+5+h5w5
         tQjN35uvehF5+zK8F5sVP4aDFAin+RPHUbOgggo8bA2Et5491D0pC2shaVEGAooHDuSn
         Ik7G33NEZhozEdYGPn069C7mKqIGf4GyW+YZeLtJOr2wh522BcVeDNJAURxAm2X+ryqL
         2tQrt90+V9YrCDq+Ip542urWcP0TdwiWHL1vuRZbViV8BkxBnpWimDp/6SEuWu51oJJB
         gArRa8bQAaDR77jentFteBPYpFpVcf+QNrI8hdLjLnhXNWGuKOR5RePRTcfD3HlxdDFk
         4Bug==
X-Gm-Message-State: AOJu0YwzFp+x6knvA4Pg/Vjl9haMDIXf+crdDGUmmG8HhC9TEbwbgWHh
	J+dMVR3IHb33UY1WB51vFwxLuepxSpO7I0zI+CRi5d87VqfNd+txSE3E82LSreYr
X-Gm-Gg: ASbGncvMcOTYDIRB0CEEkdaPcY9PoIUjeSvQGhiQMMOHdYbUM8VGeVxJ0sXsR6wGZhe
	PYpLJnPZzjgmbrBXns7NHrYloJnk/+1EPYGOxHW0Z1FS8sbKe0igkkGg1cqXX+8LcgsV/ZhMrsT
	lyJ/tjWbBrdzHBUjw5xMfIi0272uMSB3TarWR349Dm64z6O4NLsPswglF2pkFMouJLOgZKQvbVG
	wpuRUZcnpLm1BJ8z4GrHS5hGjWCqlIMznaya9atC0kb2vtsG0PVymE2OvsJE7vUQ9/Uy3b5OOeI
	IpcGObDVqqvSeJlFr4YLoxTctrMm4KnygI2UW709AfDuV3JyQDY2QYVbEDs/CHXvlyWF5DgtY8Z
	kAGFz0nYIuCMhOOCRMg==
X-Google-Smtp-Source: AGHT+IECzYwfTzmn3IQ4Aj3V+rGAhp7NHWDGzY2NSqzspKZBIMXPw1lwsOq3eiGNpxLnXa1XSq4wCg==
X-Received: by 2002:ac2:5d6c:0:b0:585:35d2:ce1a with SMTP id 2adb3069b0e04-58535d2d0d4mr1586968e87.49.1759059467189;
        Sun, 28 Sep 2025 04:37:47 -0700 (PDT)
Received: from ark ([2a01:799:8db:a400::1002])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-586d578df8asm616528e87.2.2025.09.28.04.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 04:37:45 -0700 (PDT)
Date: Sun, 28 Sep 2025 13:37:44 +0200
From: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/2] ALSA: usb-audio: add the initial mix for Presonus Studio
 1824c
Message-ID: <cover.1759059196.git.roy.vegard.ovesen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This adds a reaonable initial mix for the Presonus Studio 1824c.

The main reason for submitting a patchset is for me to practice
the different patch submit variants.

Roy Vegard Ovesen (2):
  ALSA: usb-audio: add the initial mix for Presonus Studio 1824c
  ALSA: usb-audio: don't hardcode gain for output channel of Presonus
    Studio

 sound/usb/mixer_s1810c.c | 234 +++++++++++++++++++++++----------------
 1 file changed, 139 insertions(+), 95 deletions(-)

-- 
2.51.0

