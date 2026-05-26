Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7B516F27F
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799721; cv=none; b=CxSAh1wT8z5tdGfQc2f4Pxc97bhkxZ3wNFpfRrwBdUujYOD97VyrrzAQnVUbzlHf6hkXO0FYTRd/BqJ1eqZtqNkicfwjklZpz/7J8GMwUImH+HS034tFuht1/KPvZyc0ELOg7/xmnbZkIWGZTQf0WY9fC3vhB/L/qOwFN3ZB8hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799721; c=relaxed/simple;
	bh=m/GceItf9izmgDxXf0ij7qdTlcHvcVkDr7Dd/eqL+EY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fUZ84U2lbcChrbFaiCfjwQ4UDiGa2LxjmGouNRXgXwS2i/FpCX8SIdgsHqjn6xW/bs9wFaApC3sBvgE6MV1tSGLPwS1LXvbN5YqmIFyXnGQRiivkfPZ+Ldu1YSMDyuvcmJgnBIokXmxNsaN6SQZdsGeVbpbPKX1qEfRA4poQnxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idOpXjjf; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idOpXjjf"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so34704266eec.0
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 05:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779799719; x=1780404519; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rRC0UR7DdrEHF5n8z3rovd3sy9IxWMm0Nnsp9OqSDMw=;
        b=idOpXjjf6wpxkW0agsGmnHDG3K8qqWsizccd7r5c/8KPuQUAXvSFlERxMmwqEnagur
         Xr5We7dJynxdlIn4lw8YiuArQCSum5O+XIbc0m89wSEutqUmo2xKm1+pRrl1X3W9kvKw
         4RNRSw8wG+NspjYEK9doCNAn+nnaqz9ovqOjUiCV7JFvV31XMiZfk4ISkM6CrVAS3UJG
         DS1GtwQ7FXQy3n+/ERRqsTKZe0jK6Ny+y3SQoUQFVRZiITnuOazfXKOwILBEb+RZsI7U
         jcLU0HBMnvnXYPv7vgKgHCdGd7cSW3LDWhL4/hGn9575ktqfC8bXfOurGsEnydHfItSG
         CD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799719; x=1780404519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRC0UR7DdrEHF5n8z3rovd3sy9IxWMm0Nnsp9OqSDMw=;
        b=OBlhZSf6UEj6/8uslClumW3HjmonFVR+LbgTd6siMB5a5bNXPfVVG5x7lOjA7PfXk3
         XaxU9FCrNFSS6sDdUwhL+1hTA6ttSl/OO1diRD8Rn4mbIunVeHKL1WTAQsyhTfUsTh+D
         0gLSUrmPmmcb+7VDsBKOxMNfaDohsK0Qc505pB9vOE1Lcqj5XTd9Z3Ci1+O/pBtSub6z
         NYrjHNsOAXx4vLa5CWWMVuivVuRUWEXMXDBZv6HcAr5kzQcyoA+HKcZzskmY/Ee73eVV
         2asvCcTosAv8ukmzga4kOoqNGscH8M6Ifuwi0rQYoB4g/f/brNYzLg0vo0VCyczNAvSZ
         uTHg==
X-Forwarded-Encrypted: i=1; AFNElJ+h9v3VyWZPn3STDHigQEW7aGE6HhBHRgiCX3GUiwlX3MsbrwbTUrr5hXx3CbSZuHZjU5bFqv7/RVfZrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdXl/Wk91p+DBHSv0kgalyeyukHOIdl1+PkuAxXfEquZhOzY3v
	CH0FpsVeQbqVKyCMDOw6T/20wyKQp3oOUGtFWsCFUZ9w8SUEMV/MPIK1
X-Gm-Gg: Acq92OGFBYVXQ/6gHRbYXii01kMBHskotO0X4EZdmvKxbO/ZMvfeijj2hliO50YWk5O
	5xHdWGZ5eeJbEeZ0G4rvNYw4/T51aI8+jm00YAY+R9N4TrLnMS35+ds4TOav7MvW4GExjc67OQf
	/8UKlif2IPcf5yUNqLQuNGrmesetZu116ske8opvveMuTLbKy9U2HZSQlD2c+GE1A+IEkVmXpYO
	RKqLBrledbKciICVrs2DK8oCTbFM3Fcvb8n3vCMrbps6F/yLe6V4SsfXPAxZnfNBEbGH7GKIVff
	s2UwsUme/iFLFoDmcG9nE0Eh95BOOQk1lm6/qciiDdeoGN3xtCr939/HYOEXa+8A4J6l//w2+iZ
	gRLQZ7c7TwQ54PbuLJhZMdV1GM3fT4yD1HGM1k8eKolq6NN1THu8HdvgtxkUz0JhxDr5eNT5vqx
	E+2TMjXkG9VQdbQY2SBEk1I/b4qowQI8qDB4WPiOQS4Huxbc1tStD+uzl+fGGFLDGVoBUiv8xpu
	w==
X-Received: by 2002:a05:7300:641a:b0:2ed:e15:c926 with SMTP id 5a478bee46e88-30449144597mr9815773eec.34.1779799718634;
        Tue, 26 May 2026 05:48:38 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451f20561sm9516837eec.10.2026.05.26.05.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:48:38 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ALSA: xen-front: Fix event channel stream lifetime
 bugs
Date: Tue, 26 May 2026 09:48:25 -0300
Message-Id: <20260526-alsa-xen-event-channel-fixes-v1-0-91d3a6a50778@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QqCQBCF4VeRuW5gXZeNepXoYrVjTcgYOyqC+
 O6tdflzDt9GhiwwulYbZSxiMmqJ+lRR90r6BMujNHnnowu+4TRY4hXKWKATHyfFwL2sMI4IbXC
 I4dKfqRCfjN9QhNv93za3b3TTYdK+fwHoTNtOgAAAAA==
X-Change-ID: 20260423-alsa-xen-event-channel-fixes-6e4b40e649f7
To: Takashi Iwai <tiwai@suse.com>, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=m/GceItf9izmgDxXf0ij7qdTlcHvcVkDr7Dd/eqL+EY=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFmi0xaX7u38p/B9f9y/wt5acZcv3JdKj0zdPX3LA3Wt3
 ss7hW9s6ihlYRDjYpAVU2RZnbTIck/Xg6v1cSs8YOawMoEMYeDiFICJVIsx/K87/rjFI9pfUnSt
 wie+TyszJET2dv6NO6jCLVo1e9ni2a4M/92WG9QZKs3x3Jvd/3HTTv3v1oF8ryZklfYv/xRlfew
 qHwMA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Fix two related event-channel issues in the Xen ALSA frontend.

The first patch resets the event channel's expected incoming event
id when a stream is cleared, and drops stale queued events from
the previous stream instance.

The second patch keeps the request channel connected from .open(),
where it is needed for hw-rule queries and stream open requests,
but delays the event channel until after a successful .prepare().
This prevents current-position events from reaching the ALSA position
handler before runtime buffer and period geometry are valid.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ALSA: xen-front: Reset event channel state on stream clear
      ALSA: xen-front: Connect event channel after stream prepare

 sound/xen/xen_snd_front_alsa.c    | 17 ++++++++++++-----
 sound/xen/xen_snd_front_evtchnl.c | 28 +++++++++++++++++++---------
 sound/xen/xen_snd_front_evtchnl.h |  6 ++++--
 3 files changed, 35 insertions(+), 16 deletions(-)
---
base-commit: 31d40472d5699a6139fe3a2ad6558645a99b7422
change-id: 20260423-alsa-xen-event-channel-fixes-6e4b40e649f7

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

