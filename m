Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AB833B6DB
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 22:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764110419; cv=none; b=HUtcZD+5Ev2Dh/WVI79NmIwCrJ9CD+z8YjNrc3kIgO9SpKjfmUtpev2DZXOgJIz+VO00G821/CdKVTgK3ptkDDUGcsCNhY8NztLbsXfpY7rtdiu2HBWN9iIFo6rpHYoAFGu3b4ufNHQdswDXH4rGvZA4d2OcaBz+ORB6ml+T8dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764110419; c=relaxed/simple;
	bh=63hI60cW0A2kXUjAxKqebVF+B70fJ4xOl5gP6bv2ogU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o6v57uMxWdRXRNwwoYODyMm/h4VdUcubrPVCJbGWOVFsbxPD+6+0TcYPfs8IEQVR7aDaxXU0jcKu0nZVaHFPiNJUkoCgXNrMnzIDdNLH/TYR5zOI8ONu7mTVVo+RA6UVN1/fxHV1FWpkmAbDj+maRIW7G2njjDo0YGPFMIZKG9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=hQJVlndk; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="hQJVlndk"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-880499b2bc7so60242136d6.3
        for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 14:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1764110415; x=1764715215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKqdsxjaxYQ9qBTCleKAutYC9wp/Vlt9j1a+uEF3bcs=;
        b=hQJVlndkH5SZW1G2NUBg79pUI4pOlLNN/futiEdhxV7LYMUBbF+YW7H+UbQBaQw+ed
         QulUJE6rnckXmls1Ako04d+sUyFTeA3N5J7mpCS2iQdaMobseyzwJ6ljW4JQHQaiTAFQ
         BZfZL5tM/Rw/jQzCYrPsHl+UGlJ86D5rZAs1T3Sc9Z0Kv+cIItBNkt73Aj56vIuM1eyB
         Mu5ud2z8MVJBqVli3TnhlW8mRleKKktF0csV/2F9LMbGhPvTkJdiMJOU2pgrpT3Aqu0H
         W5QJdzgwRoREdMla8YOwcXcTQZ3AfYWrAIpyEJdJ6vNCOc351xY6sEGiJ6Q78jVr09K/
         pdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764110415; x=1764715215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKqdsxjaxYQ9qBTCleKAutYC9wp/Vlt9j1a+uEF3bcs=;
        b=uS9cCVbOxDjpzgE8uFzQoqGycbhafg6znXw7D+IbK2m/tU8f5Ldr3MCFVn/ttznxqf
         2BbvURYvezpGygdPdXZPuQoOtUAVAOygg0AXP5k9y4z9tEWRL61KAYW4rt/7+IVbICus
         IfnRp1fQMhdJwDHwOPkTfFX50Mg2qSdJ+C5bdEpdu25qypgL1W7gt3SjHSjYQWZ/cKFr
         mUS+wimURzPeS8nISCI4gxc/IlUaqV/eyIxZeuVo9mWT95GhcNxYCfucSekWmAhl/Ge+
         K0jonz6HTFCo1qgDBeVz1PCr5rjPclrF9lMUb1Ba1pNJmvKxGH2hzkkoaomOECaimjZL
         ee1A==
X-Forwarded-Encrypted: i=1; AJvYcCXfv+SGzGg6iygAzZ7v2XAQuXVsInRY+C1qf2Yegp7AeJKkX/e75Y2WBxlk8Tug9xnjqLh8hT6SZDhu9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZYyQ4oyj7BA3/lKrlX+MBm+4h3md72d9o6tchlCQsQuhnaQzP
	JZIA2WOd38Xy/dwtRFBQDi6cbUv0u5oHosIz38pYcCppQTUCqXJF/9eAmSpMwsiuzUE=
X-Gm-Gg: ASbGnctYK537N01oRlEIFaB6ztFXil0QorxxEujtjSRMatoWDeU9slfQTik+GX/B3Gf
	FcUA31+ZnlaZ17CmcnsjMfTzncfpQDTWsbuzdZxjJkAIvZsK4l9LtkxPW+BQLQxCve0TwaL6n8W
	6U9euHiyFPhoixRy2M/85M6ITai54ETTLZrER5FNccktgBSjI09DM69Oezf3Z6xm5oZDIFUrXfZ
	bFb3PqY/UmUZA94HvtuGSUosCM+9LDNJNB+hBLLJ5o/Yohrk6gl1KWUvHI0XfIwIOgC0iqY6mFI
	jYI56r0V9G6g/2wSCEyuIb3hSuJOIZ5WybMfYtMtdConMNTrjyJveYkBC2uExy7qJ3bXNFYzG4w
	VAUJ1RK66lyFV0p0GyIb88ffWFnmvwlsimuV/zGAzrfIofpsOI61W3FJ4O/HeNOTzdIAjeMRLfJ
	/x6N3dx/4OyVAmBgs8ag9lnvmhTN9IYHujGx20+I1xho3Ore3pBmU3yhStcn3E0SMv9w==
X-Google-Smtp-Source: AGHT+IGwzQF1RVlze5saO5q1MJ5UpXwaodrleAw96nys+mPTP5G8nzPLfH3PEWmAqJ10Ag6iVp1tAA==
X-Received: by 2002:ad4:5ba9:0:b0:87c:651:da29 with SMTP id 6a1803df08f44-8863b0030ddmr67313546d6.35.1764110415392;
        Tue, 25 Nov 2025 14:40:15 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e54e9e2sm132836336d6.31.2025.11.25.14.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:40:15 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 0/2] ASoC: codecs: lpass-wsa-macro: add RX4/RX5/RX6/RX7/RX8
Date: Tue, 25 Nov 2025 17:35:31 -0500
Message-ID: <20251125223848.1798-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: added RX6/RX7/RX8
v3: added second relevant patch (to be able to use all the ports at the same time)

Jonathan Marek (2):
  ASoC: codecs: lpass-wsa-macro: add RX4/RX5/RX6/RX7/RX8
  ASoC: codecs: lpass-wsa-macro: use ports as the DAIs for playback

 sound/soc/codecs/lpass-wsa-macro.c | 547 ++++++++++++++---------------
 1 file changed, 257 insertions(+), 290 deletions(-)

-- 
2.51.0

