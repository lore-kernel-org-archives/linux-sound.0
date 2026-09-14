Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDFEBA34
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344197; cv=none; b=PUh5hMBR8c5tTqbacSfOqeoYUtNZRlQAoHrLbamAaQz2MoKwTCXTczTgX77eFP87WyOz+jn5wfOWcl1mK5ef3+nWi61qE6KjCAekaalBBN72SllIHK2ShRgAjYBzirB/iUV2sQoxzh3b+aa1TK+RQPMqLe9DV1XMzM4A+WZetY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344197; c=relaxed/simple;
	bh=blGe3qvg0f51TZC/BueJt8+QxSjOQEk8I3ZLXDIKtR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XB7s8mOGIQ5Ew6JA+tC7Hv5qUZ8W2TJy61ayQ2O9IUkNPLD9gysW+Gx2sx9zS/jJObiBdGVa0r0kZiI6Z9OlpLT+EAIdf07WmX3PkfHdINvEC0ybUkVlgA1GW8ulNFij+1J//UYIK3EkANEQlwQ9ihZWAH6+xIt1GHhCiMoQj3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbCBOpH5; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbCBOpH5"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso325034a91.3
        for <linux-sound@vger.kernel.org>; Sun, 13 Sep 2026 17:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789344196; x=1789948996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4a9/oZ+aHx5BCercho5lpC3JRthJz5xcHExBYY3k+6s=;
        b=RbCBOpH5pLI4Uz2PjySw34uztWq0EKSMkE5RMM7UxqY2sPYYwFfNx0RhxOrIt62u1s
         XZGsT9Rz2saXV/qVZ+LvEbOgQm9wrq6ezdhVV99A3PuuEdh/8owBBDIZlw2bqRyUiOku
         voXVPrSTKUwecoQNe2NJC7AbPDkVYEzgqnddY+E6iM21dUowOLLLRJlzGYpxvfG0bA1D
         eh4pAfo3mceXQRELNYMx5OHpkjyxFz2vEu9xsIWMvm8gbvWZm2rvJvaISWBxnKRKcYtD
         v+XxC78puCmtbc9nJefwy/8q0Q/iDl+Itx42w4ZZUulqcnWBzHz4fxY4H5vDAEPFnkiS
         iD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789344196; x=1789948996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4a9/oZ+aHx5BCercho5lpC3JRthJz5xcHExBYY3k+6s=;
        b=gAXq3AkUZ+DhqaH98Dtloel/iyPcLczaqLxuPpAjiNzE+jL7g//CYWI4QY1jwG0PHQ
         0Z0Y2/lzYKf6n2o25Cr6WygIxYfDEe26OinAcMAYY+YfdN7vdbv9X7Z7du4GyJaFt5v1
         ngBWbcrfct/G+kZNan+OVVwReCNZ4H3TXp+snnC2jCky5IGfr8FzrHyfAsueL0JpNGUE
         WxoMKCxOePh7GFAN4IYTBWOj837jG/bVMh0ruRTdjIWBU/p87aVvaCGMcDIzoxtEKgdx
         +fELAb8LDWmAG4xJc6fXG8Pr5aMj0PtwYIM8KNF7xOHptTczRZ5wIdn05Bhx6Y77pXVF
         e7WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrZjz8V0cQy/R2wkZ2pE4ysSwDVoLEnTG2JGRcm3AzAtmXJ/lMQldheqwxy3R9aI0wEF17Qn1jr2tN6g==@vger.kernel.org
X-Gm-Message-State: AFuF++kiVYI+rqHqeszQNG1jljNIO/dL0Qx0iq7cIVAWHhBDY5kMYm5s
	4RcHXSOcMa+8T5DVH4xG89P4nlcZqxKWESjNeghPWuGhigdgs8xXzWnf
X-Gm-Gg: AYBFou2xljJyZLe1h0Fcwo2CBxjbt7Epw432mCGr3jYZnpgHlIjPBZP1w4qmKKpm7kp
	CP+hZW9hwm3fhz2aboLNxQqssL/sMA42OsFHD6g0uRyRBxjYq6fS9Yn/WsTSCgWgQMpMKadHEYl
	FWVQFOuliZFy8b7+KqpKWjXxNnmTWArjpLL1SkxYyr+ux+Vx8OmJyTKV1XOB4QDSBewSEq2Okiy
	LdD+/c1Rg5PuXGY8/8GdfKRVdTdhdhgYpVUyddD7ROcwu3tluQo27FCXXHx7pCXh42hnZbrrKmc
	8zBCNxLA6PzyHIobjHNwvqygS2so/SpYDg7/1NkhMzPC95LCZL9dq6gSiA2uxkiu/W+RB2qAL8s
	O3E+OHTMV6dsAGP3kuuqj4PF0gw4AjsWfiB7EXEkJ19hhvQ6I07csN/Q5R5suSBcPt3GarWi7Zq
	XaB3YrvEyoCOBRcffE3irL6z76VJozXJCi0jUINRfy6s2jaNOsLPrXw+gLP0kXb298Ucjmidu5V
	C7p4q0VQvX97cBke015IIU2HA9vD6H1JKutSXuS2vKwXlq70rBEc5KgxKw+czoAvUGYMoEauJ6P
	cuqR/DpD4sJ8ET9aVRMQzNjq69OJefo=
X-Received: by 2002:a17:90b:2885:b0:398:bac0:238e with SMTP id 98e67ed59e1d1-39dec27c782mr289313a91.6.1789344195634;
        Sun, 13 Sep 2026 17:03:15 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.104])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba71cesm22734169c88.13.2026.09.13.17.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:03:15 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: rf@opensource.cirrus.com,
	david.rhodes@cirrus.com
Cc: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: ALSA: hda/cs35l56: same calibration condition logged at dev_info() and dev_err()
Date: Mon, 14 Sep 2026 05:33:08 +0530
Message-ID: <20260914000308.108995-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/sound/codecs/cs35l56.rst says "Failed to write calibration"
has the "same meaning and cause as 'Calibration disabled due to missing
firmware controls'". The latter is a dev_info(). The former is a dev_warn()
with a dev_err() from cs_amp_write_cal_coeff() ahead of it.

Rebinding the HDA components without re-probing the i2c driver takes the
loud path, 4 of 4 attempts here:

    cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: Failed to write to 'CAL_R': -1
    cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: Failed to write calibration: -1

list_empty() is false because the controls cs_dsp_power_down() disabled at
unbind are still on ctl_list, so the dev_info() branch is skipped.

The calibration is intact. CAL_CHECKSUM, CAL_STATUS, CAL_R and CAL_AMBIENT
in DSP YM are unchanged across a failing rebind on both amps. On a speaker
amplifier "Failed to write calibration" reads as a protection failure.

I lost around 5 hours chasing this down, believing this to be an actual
bug.

Lenovo Yoga Pro 7 14IAH10 (83KF), kernel 7.2.4, two CS35L56 B0 on I2C
behind CSC3556:00 over the HDA link.

Assisted-by: LLM
