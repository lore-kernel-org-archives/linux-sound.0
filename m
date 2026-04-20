Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9B141C62
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 07:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776671284; cv=none; b=SJl35/rxyjLrGE9JHWv0Pa4okE4rd+7CqotCTq0uuv180idJ0v79umgFXrFHsLC4a/p2fCGzHibSqooWUxlSDxXTVp1vsSsdt36FVMHSE//1LNRdgIghWraIKE9YT9EcALhFvPYr29qnO74LPxvY8kPMp4bqfzYr2cl2+EHt/rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776671284; c=relaxed/simple;
	bh=myIinFS2sN9Z6+PIHxYziid+Gpm5IqHSQOuorLpWV9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5pF+KERZ9OPH9iSPVOWLkEsfUh1QIDFvpTjmB8uQQtJWL+sUEpKchmMbpX9DbbDqYVaBtRaWx23Oniwgcpe3uqiuZdcnE7NIYN950fTHuIfta2lyXvwWQqV0vNkL+yf6CHX4yCzmLVHHkQ7P0oEpgrksPWctvWgwd28CBbB3h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=KjQNvoI5; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="KjQNvoI5"
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DB2FD3F1C0
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 07:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1776671273;
	bh=myIinFS2sN9Z6+PIHxYziid+Gpm5IqHSQOuorLpWV9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=KjQNvoI5hghGkGh2/QiXPvkCwExxqHIi/Jz1XqsFcy+Pe0wY+FO6Dh/YDSvGXncT9
	 ABjkneEUPPxlnLbGZx1hja/aeTnt82sGZUhYnf5x/zrFOBUmSHo0JVr60njDTDH4k3
	 4l5BiGiAE+8yBYNS2dmO9WKE87nrJbpYO+boR45ghzQHKJrxnrKBDqwPHDmuNAswsp
	 Qk2RGq7M8rS+Bp6a8XAkz3Da0dsgNNZ2hGVFHITV93rUW4I+uEf55e/Wo+Wv57gcH0
	 alNTuIeNpSQMWUNY0r2FlHUnHprUSHGsAhvdoXrfj8kZIwBMVW/hQFhwzNISfZFf6F
	 o61azN0PaYsDY5vUlKjjJHMOJUqPvw/+PIKh1repcOrDLKnb+t796iLDZSP2sBEveG
	 zRfyKuVI6iltdZDIqDSffQyqIOqib/bXZY7HUgrkJdtvRTig7ZBvzYDJpUnNqT/8v4
	 jNinfJwtjD1xwypGXLjYxnbf4c+rbzhLw5JGjAzYbOE0SzG5el80wonBpWN4VDFIoM
	 hOIcVhEQmWhY6u+UQ6sR5D97Lndgy0rOLSVslpoBHWW6hmK6HxGbARDYOeyU5Uf7uN
	 rsa+hiSbJ+dXr77sftSVWAtKzyxWXGRcOy05MeSb8Sd6BI3vFkH9fDYh+6ro9udxZ8
	 n3wpEHdNLl7vLrr8d1lqGTqc=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43d103e46c3so1900253f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 00:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776671273; x=1777276073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=myIinFS2sN9Z6+PIHxYziid+Gpm5IqHSQOuorLpWV9Q=;
        b=EgsoK/yBTRehySb02r2V0p8NI8w4PzPTtsihq2TV1conxD4a575m+WdPjrf5kGsf+/
         m92ruaat+/1jrv/J3lro5ZdL1v2uwzYAw13kmDwiNH+2omNRiDh27p4N4bgTf53JXjS+
         pQe72wLpnq41hyEkHXEPYOdLEjKp/c5VhEQYH4oLOclRvb3ffFZja83KqXz9jHoCmqG0
         8NLXnZbdL0IuqJx6oQ0rtzIkegF2CYMdqX/IzDUk0dWGUxxGQxckk45EpEGfjkbo2it9
         zuR9pw3aNPWj1xcfE6raH90LjjpVjMD/Wct1uL+t612qDWv4lPItBucWe6Ck3CcWelvc
         HkwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ly5U/jzA42z02VdHg1Wk+p3Si5ugRQOAp8C6395pfy/kNBSsW9g9+cSxvbLOzjYmrGtfT997ZQ/KClA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze3AMAL8GZ3W7RAT6hrha05uRp/7TCwYgV+c7JzZ9v2pd/ZuOU
	umO7NT1c/75q2zkYXtIXB8jUhi59DOGr0aaUJen7jrMhlt4vHp5DvUlBYMJr36YVWaLc67tnKSl
	Ngw6l1JyH+IX1TeXRXuME6lzhuZNZm4+RIwTvwngGul6SNHZ7ZuCoHIO6xeg9xB+Ir47FEtF2UA
	MRJeXG
X-Gm-Gg: AeBDiet53TShxf4gFdmya+q57M6SXoRzOVtcbEXlfwRofoz8MFxG4hAkPiiqt/5obcK
	6wrAJvCth2bpGwBh1U+jII6aAy0hgRPbfG//HceqXatZXAGqZJpqZXlvTAj9himV6RAWdT0T5Sk
	lUJshdmEAK4hXkiyKa9HMheAwV7I/2E+gfJq6E4bCJLrlpt5oHa8bJHDmQVOynsE6gO5jUCbJNx
	8NFXvSQ0GDxiE9chIPhn0V6T9H3aJDQT7bBfVYKCiS9v3JHcXFA8k3BlZxDw+Hep+1gxK9CJ7Qy
	rprycCx2bRrXMiVSgozrNO3tmccmAil0SDFrbM9dOOuuaez1fOKKDFAT1M1u1PZ7TKKbetuBRKj
	fSEwifpbT1k7xuC3ne5gMvAgYiLna4nqmyPlF5T2/2jCo+imq
X-Received: by 2002:a05:600c:34c3:b0:485:41c4:e2e4 with SMTP id 5b1f17b1804b1-488fb792dd0mr175641605e9.23.1776671273431;
        Mon, 20 Apr 2026 00:47:53 -0700 (PDT)
X-Received: by 2002:a05:600c:34c3:b0:485:41c4:e2e4 with SMTP id 5b1f17b1804b1-488fb792dd0mr175641435e9.23.1776671273041;
        Mon, 20 Apr 2026 00:47:53 -0700 (PDT)
Received: from localhost.localdomain ([103.155.100.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489201cde98sm26575555e9.7.2026.04.20.00.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:47:52 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: mstrozek@opensource.cirrus.com
Cc: broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	perex@perex.cz,
	tiwai@suse.com,
	yung-chuan.liao@linux.intel.com
Subject: Re: [PATCH] ASoC: sdw_utils: cs42l43: allow spk component names to be combined
Date: Mon, 20 Apr 2026 15:47:39 +0800
Message-ID: <20260420074739.705268-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417144529.2385360-1-mstrozek@opensource.cirrus.com>
References: <20260417144529.2385360-1-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Maciej,

Tested on hardware, 4x CS35L57 on Links 1&2, cs42l43 on Link 3.
Card fails to probe with -524.

In spk_rtd_init(), snd_soc_rtd_to_codec(rtd, 0)->component gets
cs35l56 (enumerates first), not cs42l43. cs35l56 has no component-level
set_sysclk, so it returns -ENOTSUPP.

Fix: use dai->component instead of snd_soc_rtd_to_codec(rtd, 0)->component.

Thanks,
Aaron
