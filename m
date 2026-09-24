Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815A73BB67F
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 21:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286946; cv=none; b=U+VbNfeDr8bnNtGJMT4XHeaAR0bA7wxkLanItajPsYgITukWbHRL3A78+Tz+x+2Tl16ZeFkEM4PbOJO3fpkhZMjvYd7kf23NqPrD6afeXZ3jME/Q0mQVimpWBSxRtRIuc0Df2giYl/wi9SmfNmf2f8gsuHXIxu9bU5V1kWUi8NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286946; c=relaxed/simple;
	bh=5X2lfJIjjqVFbz4HDDAzzBlOjoJiLvd4Nm6Uck1XPK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XlxbMZVkl/JYXZ6ffFqLP4xDE+RixM3Gj7KAnrVL8a/0QFNLCwWyra72t0FcTM0W0lx6AyXZk0z+0Iop62dgMEIsN8zyF7pT+Af6EB+lNfyPclRjoj0i63FJRwmS3kn5czKJkGzo0SnIX1lE/UEmO+mBvY84eY9FqBEAC3Zv024=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HtKuF7WH; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HtKuF7WH"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so140161f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 14:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286944; x=1790891744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5X2lfJIjjqVFbz4HDDAzzBlOjoJiLvd4Nm6Uck1XPK8=;
        b=HtKuF7WHrsTVSvXavbAsPp2K06p7IbVuMYE507BmaPRK62VTzWKxDF0fv+Yap6mAo5
         AwS4JHyh+wx14Vm7BdAUS2+lnWZwh9k0QNJthIh2UxQW1yIYiRTNJ+/w2cIflHamefbA
         j+xMSO0APvPCRdh+69VXbLefIVU1PwPxF8NPJPcPDTHmnSJK12ZqkOsBqlWtwsqSerkL
         izIL+1d00E5OQ0fhoLl4T9g0qgkmNMVU+pH/p4mjz6mT2xPftDOEbHye6iu/smdFVrlB
         8Rtzrgi3wwwBQLttyEnRDEhqTeBZ3TRFSfdfa+HCaHEn0xjeuZoel9Vsw4cz/UgLE1xy
         etdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286944; x=1790891744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5X2lfJIjjqVFbz4HDDAzzBlOjoJiLvd4Nm6Uck1XPK8=;
        b=1iNF2F9mJeHNunC6chFCcnXunkDm3Rzd/2HkKXCdojMQ+aKrTHv2p+FpwekThBDNut
         HMWb3EzhyM6Nk1u0Z6M8scr+4aHKA/86ukaGsZKxr4sXek7OnIcGQM5+kQ+LyaopXW2K
         lU15zedByUTBiUIqbJ0JPLsBWHqcgZ6PlXwYTnVIiE2zgSM3ZirQmiVRPxQGD/iZvDI9
         RgkdRe5XhkfGeDiCcOCYiUN80f4Qq8TTzvd4CiUGJl0ivBXtVe09YC6GQaZjSp6WvFcM
         B7no1UxASsQO4V8iHuaCGaNrNZUrug94x6a/8AVC5KiZn8HVeU4i5Q2k+XVqeyBJMrt1
         D84A==
X-Forwarded-Encrypted: i=1; AKwUvBwGlRzgs07MpmXvaPglvkuYhw7dbSnqL3NZb8RM1tb8JbbWNk1Molp/4Y6zAIMHwpPJp65tVN7H2q9JMA==@vger.kernel.org
X-Gm-Message-State: AFuF++m2bB2n+fjBNxM7bXuIgKbJ1a2Vqd+z4jxA2aKG/RDt8DAjDA5d
	sgnM6IpqPOE5DWPRt2nAIFPbEwD5EXZsiC7arMP6nIVlhFKuzLtQWFeMFsryZtLenPTlJA==
X-Gm-Gg: AYBFou0PkFhYTUSu9UzZ2BWJYvdX37NqZbp+Y+Vl4HQ9YgIAtwuOSDTcIHmCDFWixW7
	LgL56nOePA9CPr2c4vNjAhBak+83QWVVzawpUGKAE73OGKndYIOveXdXgih9xko11Ec1Sz48bT+
	OVGfx3/MFfZV56KpSOm+glpyly3kFAoXfM6JXbjhi7TKc+/FUkE05mn9XbtXAbdl4dClWhj7Q1W
	tUSqJo2EooncoiEm6rCUqV+v/KYaMpyAJXG44e3RykjYbndVPKJwItcdeb3Vz4NrHmjIfGmy2mC
	e89ZA7qVP4quG+62uwZ6xKGf6a18+KKwjZ/SCNvXRYdTap+3BE222lxdBTuqUKSG1mMsLEz4yFp
	Ee7bgjA0YMe2qDmp8uSHl2M/MFIJmwY7QWtTwD08prciFFiaZlZFaj5NxhPnDSMbMkepb/fadxc
	2+JJG1kPLea5gonJziIQhsfoPWYFnBjGefZz71r5n+Hc+RkaMwNxikzU05z9/Tyhc0/al5wGW5B
	ymxt2D2EOhwdh4DDWQqndR1HsgUqHOLOqkfIM2YjYiqSZAMJ5/4HWyRyDXDZ5CMEEhD+MWDrkiP
	fpRYS4nzkbTJepk6
X-Received: by 2002:a05:6000:178b:b0:487:662:cb90 with SMTP id ffacd0b85a97d-488716993f8mr7479416f8f.34.1790286943685;
        Thu, 24 Sep 2026 14:55:43 -0700 (PDT)
Received: from 1Z10 (mob-176-245-31-160.net.vodafone.it. [176.245.31.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm2288950f8f.22.2026.09.24.14.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:55:43 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Yung-Chuan Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/2] ASoC: Intel: Add Yoga Book RT5677 support
Date: Thu, 24 Sep 2026 23:55:40 +0200
Message-ID: <20260924215540.933043-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902123007.769820-1-mauriziocasciano7@gmail.com>
References: <20260902123007.769820-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mark, Cezary,

This v7 series has been pending since September 2. It restores the dual
SST/SOF machine entry and includes separate runtime validation for both
firmware paths on the YB1-X91L. The series remains unchanged.

Please let me know if any further changes or testing are needed.

With Best Regards,
Maurizio Casciano
