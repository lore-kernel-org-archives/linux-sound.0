Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A3B13635C
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 22:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694998; cv=none; b=K78Yz7BPgqkOPmiWx0kZNGU41DorUNq5qkQcbxDCLje7jJBYNObKIoBmcy68V7AbPp/CQSDkXXd2Sh3RldGxmAt1PGagsoN/51Vrw+KiR6mjWXntr7veS93EvYxTHYFkrjQs3zsNsCdRA6S5wwR/sKyThGdg56ZbW6wevHpMvr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694998; c=relaxed/simple;
	bh=9LpaSJgmRMlkt/ew6iNm7enYTxpHeEfrDaHr9DlE+fU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=juRN97/lfND8zRRtDIgVQPRYhHNDjIz9bhScQ5kAOrIb3YYLGsRPi2DcE/KR1uqr51slH143sthTtyyVuSvRopC3A07T18NxGz7wuALPzsqg8IDEOEKP9Go7fXLB3r0N+O0VzxVRA7iOdZGG+5Juo8j+bX0D6QrBj4COmkqa0nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=edburcher.com; spf=pass smtp.mailfrom=edburcher.com; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=edburcher.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=edburcher.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a3706ff36bso1211549f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 15:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747694993; x=1748299793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UV8DuQGNuovFl5aqoA3JyJGsFXZAmE5q46SnUq5DeJA=;
        b=r3e0FCpdHPbBJX+oUf5y9k5zTooOoNQs5j68xlTrTv4q6w4htJJPDLWqt/oTrcKqvH
         0V4w3RbmYYSjtlNmky5YSYUY9HTuFgRRz5nihwUiL9Kvdgr7QrxCMTYzMi1g0hzpwBs7
         VSqpSWFpM6Dv0p71SzGqv0QXeGq1EnB12AF5azNlAtVtih4JCCy7yCfN9LhkIT3Km/m6
         PZAdeXUhULaxXmrAqCxlyR7VVtIk1XQuwmr1vdHCGP/Qx1TWFG7cQWmYu9EoPn/sig7u
         /N3NSDoeml+3j373xCyjkYEeoCsWVPlGQT9ooRKp8GcVPnFJgiF2dYwyrtPfbxvgHpQj
         J8lw==
X-Forwarded-Encrypted: i=1; AJvYcCVSZf5+HqZqtXZ/9unqO2xRZEYfEnegMED/Ng5UPTGHUePqhx3NOwE524iDYgJ0lZnnkQbfD69DhnZCXA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+xKbiz2h5I6gSdB4fNGGxBHrogpcj/NqajA9TcVUtLAH0Wplv
	h1KuhJPNNPUabLDOh68qY/pHjjClREeenQ5GZ0Q73v8cd9lyJDqRmDXbTFDTwbZb+4tbgQDt3lD
	Aq9r/xEg=
X-Gm-Gg: ASbGncuJbIG2awOW5zbD8C1f+K7y/2HUagYTxGeI7SVaPoStkLgn60B9lANdX46G9w5
	vKLu4f3mfBjsZVgCvMgwP7vIjIXZbBUYGbe9qVXKNa4LaqeeOC3EjKt4Tdy6SGCr67d2CSiqv6E
	CKfzZf6FX0KfxEBTacVOKcv8Y7p0Ch/AurcAJ+b7f7OunABXbvIovQa42LxBihfQgUbt5yc4pmh
	a7tYJpNHvcL9wZ6I6v9iuXhYEEo1G7406sJpoIbmdvOks4371ssbXMJ4T8sCt9JTebmgKpJe3GS
	na5wpF85eVAdA3pGITynNWciqVj7KQGkIjukQIlW6iv+0gzTFRk=
X-Google-Smtp-Source: AGHT+IEvj4BcDUPoQGdTApENPldt9AVPy7zELIX/Lew71RRJpmChJA7bnpf6bqrd18GKnNX2pQ6fSg==
X-Received: by 2002:a05:6000:178e:b0:3a0:9de8:8a45 with SMTP id ffacd0b85a97d-3a35c82f691mr11743278f8f.32.1747694993383;
        Mon, 19 May 2025 15:49:53 -0700 (PDT)
Received: from electron.local ([188.74.119.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a5b4sm14054161f8f.21.2025.05.19.15.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 15:49:52 -0700 (PDT)
From: Ed Burcher <git@edburcher.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: git@edburcher.com,
	linux-sound@vger.kernel.org
Subject: [PATCH 0/1] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ASP10
Date: Mon, 19 May 2025 23:49:06 +0100
Message-ID: <20250519224907.31265-1-git@edburcher.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, I found that the Lenovo Yoga Pro 7 Gen 10 (AMD) model 14ASP10 (board 83LX) 
needs the existing ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN quirk to be used for 
the bass speakers to work correctly.

I'm resubmitting the patch for your consideration. (I added the Signed-off-by tag)

Thanks

Ed Burcher (1):
  ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ASP10

 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.48.1

