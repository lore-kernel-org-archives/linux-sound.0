Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D7B3AFD06
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 08:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881930; cv=none; b=gUYyikzGWbn/BddF7Dcfvd5tmmjxKo7QdI/jpZcveuT5GGP3vapmZslsWpLU3g9Va1ObIKkn6c8Iljz0EYfjByca6unnpZB1vWxF1tncBpMALvTxGRit9aRSXtZgvWH6PpL/KtgAf6DZXGOswDzFhSU6Dr40dzekLr1pLiI5Mho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881930; c=relaxed/simple;
	bh=vTfdCxEdBXHQYMPQG2sI01/Fee10SmTRjVOVPrVV/a4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SWVe8qC6AOGEKMGZVU11RY4m69aL0W1ZvA9gSEiv0G8ukDFzOZexZ4tVXiNB51PYIjCrmDuzlzz/B8U15K+WUM8+Js89r7rvspyJVBN8yzZ9v20r6BZ48s37iW09muBSdnZYd6iBGUIWzzMloSh/5F01qfFfjhqr4hodo/Mlaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EW3W5Qgc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EW3W5Qgc"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e7006bbf77so14590375ad.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791881929; x=1792486729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vTfdCxEdBXHQYMPQG2sI01/Fee10SmTRjVOVPrVV/a4=;
        b=EW3W5QgcFupcE7GElD5m1l8x3ZcIY83BW7cfJ8hHtc5ZCAeg/7yUipLhanC4z0igpp
         p9H0RrzOXiACNcS6OrwKtIaso/fJL5XLUo8tqO81ZJgdiYvcMMKpcVto/QU6LkaWRkig
         l+acjSbJ+B/44nedwmUWZwhuOOiU3OgpobSe8cCS/wc90qL5QIMYVYuNsrJB4rDALGzx
         75OTdZqdHRGB/w8JtPt2DaT0Ffe5c4CkvptehWjjrMupbxil15TQIgsYPSGZmPcB/LSX
         /anUEC9lzuyEs/dCjnyi1ItVb1j9PSvXW7a4bZWIwABlc1k4DbHMa6LHIcldCikV2tyu
         znLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881929; x=1792486729;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTfdCxEdBXHQYMPQG2sI01/Fee10SmTRjVOVPrVV/a4=;
        b=FXyVtc7cKuzZh5Js1909D+fyYPyAjdu47iOI87MdDbqrTXmbqtf3MSW7cYfy7rT+An
         2/Q/gBfsMY5KZFUDiP652bDbXsV0GXnuuAwbXYPqG0O3aYgRBbD/nM3of9ZB7NkFdbmq
         mtEyL9SCnT3FiNc+1M060E0mu6uBmSnbSm/PZ5wyvBNzLENLlXTr14bY0WDRzf34/MqI
         VCk6VSZfFWadmMQslsEkkdieD3SoN0bg/phrXIHIJDS/sdw+0cz9N8ZnkCpR5ihHlIQ0
         ypirG1hfrFpXaC2OjwdDFAdy7AFMREq4Dmznw3ZVqHD5B9ddOqb4qHnZEHj5mi/MdrcS
         XFAA==
X-Forwarded-Encrypted: i=1; AKwUvBxN/8ltX9N/AKui65hNRoZEjYp/5BZHRJyuwRzptVWeA6NhO9L7sA3qbJLDFiaLcGfYeApacYTMl/eKnw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKcfgEYq5PTbSTAj1XETY7ijjn52m4OUcaynJ4F/hNiiwz5+afx
	LgqpoudaaM8yml/3UfpmRnTYmscRbhDRZ3qUoPgl7Hy7C/SzOl29x41q
X-Gm-Gg: AYBFou3uQJzI5W+S0l0KNj78CMF/AB8C0dFGvtN9ox8/T+fbiAjKjWy+wBv8KOg37mm
	8c1aYtfvrneE602HG6Lrb0O7L1MKoU8KJeCT8sKu0FczKMlxPuZOCHQl6pNrzNvsUcg9kZyTi+/
	xbRY+CI/Z6bSk1bp/vdKwCOFYvdE8ko0ijTCcovuv8+bLhr715j8P48S7WahiSv+pgMY4pTN4uH
	4vGYHt2GnoMyhnFDPJ7m/OaRceqXYzkEpImehlZpCRZOdTd+kvbFOMrHcWWl2s/Q/T5nGVlFF/y
	/ecBjxcCIAwvfv0m+wn55JTibVVSiNztwzlFDNwuOA3t0Wuzth2qCUia0UbFIHPf8faF48UnF7y
	kSxUQh5+9Y8rxZs4Y1Q017LjEiEL5ec6p6H2CXWK4KHhKeyTzfyy8YYsa0eoGmPkiBoB1rLJcEG
	y8YyUco3v/tly3hq8VIz8gCKXXkp9IutW616aH0EL+CqUQ3tg1nL+dMbb2W9Im6dduQTtIm5XmQ
	DSzGjW3qRns5OtdOacXqR2UruSMZgfLq1xfdNIYq8FWvCTfhg8EL8aanNNPntDYW48lAsp27ENI
	+S9AL0j5yvPBGkiG
X-Received: by 2002:a17:902:ce02:b0:2e2:e3aa:7a35 with SMTP id d9443c01a7336-2e842cdbb52mr99456075ad.36.1791881928729;
        Tue, 13 Oct 2026 01:58:48 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b298dsm51354965ad.33.2026.10.13.01.58.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 01:58:45 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: sashiko-bot@kernel.org
Cc: virtualization@lists.linux.dev,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Eugenio Perez <eperezma@redhat.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/5] ALSA: virtio: Recover PCM state after a failed start
Date: Tue, 13 Oct 2026 17:58:40 +0900
Message-ID: <179188181241.52451.2155648650411097919@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <sashiko-outbox-169220@kernel.org>
References: <cover.1791877396.git.mynameisjune111@gmail.com> <sashiko-outbox-169220@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for pointing this out. The ALSA stream lock does not cover these
callbacks, so the stopped accesses need the driver's own lock.

In v3, all accesses to vss->stopped use vss->lock, including open, STOP,
hw_params, prepare and the final clear in sync_stop. The RELEASE decision
and stopped=true transition are in one critical section. Allocation,
control-message waits and work cancellation remain outside the spinlock.

The regression catches the unlocked v2 accesses and passes 73 lifecycle
checks with v3. This uses deterministic source instrumentation, not KCSAN.

The updated series is in the new [PATCH v3 0/5] thread.

v3 cover Message-ID: <cover.1791881787.git.mynameisjune111@gmail.com>
