Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506E02D8387
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540278; cv=none; b=lUlFJ9VMHrtpn8Alz0V51sxB+ZBAUUEXyjZKxxDf4xQqcvh0IW0bap9kpm0yoyb5e1newUsDO4j13jrCzLxg6LXBTgrXs1ae7ogp5Kin1VtkS5F/mEfCsqbIrdYUCJFmRjwTjiG3XiAXabIs9pt158hX1IU3jmn88AJO+siG68g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540278; c=relaxed/simple;
	bh=hhqFEZrqT+Fn3YGld2AlCsW1gwRxXhq+dTi0XOW0+iM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZofryR1ZZRk+Hdwylo3xV3PSxtN3y97PVr6GrtZcYyQREFMzvdP9i4TMDxaJUyT7+1YZ+u/V5+oawWsQnsdqStr0W6jcRZ/ptiOiJWEBjtyAJodOMa3S14MQ2Q/nw7TMS42nOBcHXviXh6wwKBKr2GW5h57xDbUGtxElCt1y0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUzpoBZ9; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUzpoBZ9"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so5493142f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760540275; x=1761145075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7CXQSy1xFyJqHbdJX74Wcje21ijiNP/kNa8s//JKNg=;
        b=bUzpoBZ9lLufnkt677W2xNXSZ5i7VMxgURdOi1Ja5tjhOoFuV43RRRNe12rYMRnC2U
         LJuilfg3oHun6ozllBEKQuuE9bXC+Y0oNIv+eld8jgznv4hA5c+6e0qb2SlWJWoo6Vlb
         JT7HBgdqgl6+oDX9akn8TSQM2SnIpLDmoEGAPpw7v4mot0d3amf2a1wBTfcvGui8+CFI
         AbyBXAJTWU6UFLiaklnw3xgrKF8WUgUVcC8hkXYBS3mFSQ/8ORrtcV+cq6x1hM0VdBI3
         eVnr0KgwfD6cXUYTqlsyAPotRDjOiAVyBhymhPWTV/t6ap8a5oOtZ65nBMl+aBwj+nFC
         Rb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540275; x=1761145075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7CXQSy1xFyJqHbdJX74Wcje21ijiNP/kNa8s//JKNg=;
        b=gePC6X7bMWnx+93ypG0EyRDRfUcGR7Dy4M3iuB9vvQ2Km7vtinPGmuBrbdjzUSAiUf
         FO4w0xqzTTqyT6jYRnjPZC3pPhpGFG4mfR8XR/HVgDijJgdHUaBlSDWLEMA0dLup+T5Q
         MYS6wrJ7iFk1nij9KTyP9cj7eflTQg6Rmy3VBrBhyI/YonVIpVy+h0T+bpeeIAN7tNP+
         iX6wikCL2NsCycdyJX70qyKEHERIsKMbTdC9blRNHjFK2s2hp8p3Gk7OpnJFPyJiLmUT
         Xbd1gL5ex9F+wmg3IP4XqgvbSdAnOP3YvlVQDAjDswoFmrVjM1HfeqdVELi3IXal//yD
         fsHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt6PXszsmc6kbYN1Mg7o1s8ryHuwDFqzTmn809Q0ioVEKiWjdM68fLZs+YBYXzzMTGqcbaWf0ri1BR4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSYJWL9YMyVsQJKS5sdmD0oG00jdrCOMU/TCyr3Dlchxd5x2o6
	5wOxdaJQXNXEXmP6lFF/ip1JQFRFfU+5hXmnExtmYELQ7a0uoT0G6NET
X-Gm-Gg: ASbGncsyJ5aA81u2tJ/xuIkzC0os0yPtahSRGbgmWS2/lAO733Baq+cBC9OS9fsyg20
	KT+NgDE43XmPag/6XI0Gb8NDce8puIcKTT8w+GXsat1Y49UXY5/ilDz05SiZWbR1zLUvLrhjD73
	hATk7wmnYQAFHa5QxPEhdNbGxetUddFy4gjQTn60z4u+rArFJ829U151iwAuPteH9KgxyQfkx5B
	QoFsSZVIXfKl97fPWAIgwaRkJqgX6CUwVURqkOibkdF7gd/CgWxzV4XC7XG4dg9CtAbQd+WnAjq
	wAQOdOtQ8gNFbKJpSKju9uK1HzTMfceEFNtB0GtGiEmjVkziTfWRUPI1E+0MlQM1DPvB88/G60r
	UhlZ+VrgOY7+FZWMfUDhiqCMf3+5EJ8jvgCQNfrDgioI=
X-Google-Smtp-Source: AGHT+IEIgjyn2T823EOBHK74/bH5E8XubiheWOevx+dd9/z3Zim2+niS7dN8jYFnYWY5DdBRVqRRAg==
X-Received: by 2002:a5d:588b:0:b0:425:86c2:7b4a with SMTP id ffacd0b85a97d-4266d0da0a8mr18125593f8f.24.1760540274381;
        Wed, 15 Oct 2025 07:57:54 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426ce5e0e70sm29440947f8f.40.2025.10.15.07.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 07:57:53 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: tiwai@suse.de
Cc: Dell.Client.Kernel@dell.com,
	amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	regressions@lists.linux.dev,
	rf@opensource.cirrus.com,
	safinaskar@gmail.com
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory)
Date: Wed, 15 Oct 2025 17:57:49 +0300
Message-ID: <20251015145749.2572-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <87o6q8l68r.wl-tiwai@suse.de>
References: <87o6q8l68r.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Takashi Iwai <tiwai@suse.de>:
> If that's the case, try to choose HDA-Intel driver by passing
> snd_intel_dspcfg.dsp_driver=1 boot option.  Or disabling
> CONFIG_SND_SOC_INTEL_AVS could help, too.

Passing snd_intel_dspcfg.dsp_driver=1 indeed helped me.

-- 
Askar Safin
