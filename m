Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133882405F5
	for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444352; cv=none; b=cBPkbrYch/Ilo/b60wKF4wSsgW96b3wHkhwJ0T3KfMzfU3fOHyCx/AIDPoy1zuhoyFVsx8Y5KF1+g6Z6bXvc7XwlPZ+yDRP36hrv89UoLueMVyCc+Ed9T4RR1rIH5DYMZ6wnYsTcBMq6J/wc/IRn3ZmL0+p08tErQ2fGo2xg4bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444352; c=relaxed/simple;
	bh=QHfUzApUEKGymgCU0ibV0RvNyL8ndz/ADx0x3sfKtKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7YbBvMnjLb3uGMCCp4kxwZm1YNxAQ+QLWMIG/YPi5uZ2UL8uRDgEskxrEFJQ54BwPmhAz5oL4seIdeSzwpqdf03Ttml/eYPfAXYnzaUrarU4YK84t74OZD5ZppJ7JIbPjhdjoCmTOVl+gFAzU5+Pw3k9aBYp+fv+Z0iOOixAeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wAc1RrR3; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wAc1RrR3"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23aeac7d77aso19410125ad.3
        for <linux-sound@vger.kernel.org>; Fri, 25 Jul 2025 04:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753444350; x=1754049150; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QHfUzApUEKGymgCU0ibV0RvNyL8ndz/ADx0x3sfKtKE=;
        b=wAc1RrR3V65K7EmNOT7Cidhoa1sYsOdSfR9dXTBTrzD/6iQfKFfi9rTj0gKDJh7UzF
         ZAguFrSZXIl7j39OZxnVML77w3uCBLbA7v/CCrMtQCr1ijN1Ammvd/Y0FTJvTEVxAGuL
         qXH4mfDbKBIlTEwTg0FNrOyX2tR1jTmXHQya4wX19fZ+SQCAoiZJR3Lzx0dspemgdh4D
         gyhq/OzY2Mdonlb/aX7NRziRF6SyfmrOv902hpSA9BGhYNLboQm4Qd7WNde4wWZ7Vqxx
         BZ2v5fKZFh4FmKceD5T4ZmGwyzNADi5unOUXXDBPQKfpGwLJdCCVC16XuursvRSJf7mU
         CrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444350; x=1754049150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHfUzApUEKGymgCU0ibV0RvNyL8ndz/ADx0x3sfKtKE=;
        b=I2ip5z39srhujbdhI7AnLl1PPGqOT8tUwLHBkwUHfg0qOsTXDQbRr3HeJDSXRgLAqd
         BUw+eGTZbsukfDxKs6x0mWCDfxCRcQrgmjz4ET/Mo6Qc07Julkh04gO82/FNSsuZJjzc
         C+3sXSOkpAmWOuP0Uw8U36EStzWpn8kT4jmFX9iszVexACgvonKfdgMdZiL2c9L79oE7
         qtz9ZfwMLRIQkPxTrzBzh2APsYArAQcTWXbzXZPlKFgSUuhavjyjoOIvCUh7bNR2Ie4W
         8UCZJS/Hde92jiS1MhiqemEtv5bF0PRBE+9dtue3tbefZSQZcAiKgdaMtA90rpZM/slR
         tpGA==
X-Forwarded-Encrypted: i=1; AJvYcCWAWikj89FIOwYOBLzNZXTbbKdSLHWkQKkBvSdiXDvKwE5uzPuMClIRcc5x3J/S/hJI7kR2mBfgUabNUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJLGHnUeeQvtZTKNTn2YojN6sCGGSbt0o4RaIJGb/GVAquNRjz
	dylk9sB2WE97C8ADFPMRiHmZ5HFL991QdmbYIZczTk7esAmA/bixqoIHKz0tbymaEoBTY8aIGlq
	M0EwuFaGQwJ79t3+uKuT7ZI/bkVaUeepRL3pM4v4m
X-Gm-Gg: ASbGncszisM6LJ50hLIe2bzC3C9b1zW0C4HHJuB5GGkZe14LwuUtxDCqBOe3+f+zAvR
	lDjSO8mdlLL//xDe7LRdQzsGMlhfKJ+VLbkcNXEQYJVfHO7ILI46Kwb7bCfTk/MKgMWeHMovFwm
	2ESkLsGzZMfuKxlHbWdjEPKXGX1QqRv1dmwXEuaV37rX8PAenZjmtghWDLTLVCR9xitK0GZHie/
	3pqcZpNGofjsidlhUeLj8t29nB/T8aams19lM3Jso4tbX3b0hI=
X-Google-Smtp-Source: AGHT+IG5GfmK3MrOBGZHbuRXhEHK6RPABvTMzdf8n43yLckQ5vo4Q8NkC5md2ykU1zeemIwnNM0VGxJVKLMifYpsCx8=
X-Received: by 2002:a17:902:ea0e:b0:234:c8f6:1b11 with SMTP id
 d9443c01a7336-23fb3167767mr23036425ad.44.1753444349904; Fri, 25 Jul 2025
 04:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711082441.4193295-1-verhaegen@google.com>
 <aHEEu1eSSGRhITmW@vaman> <CAAntYmKea1p=ao3OOWb=1Q+BXdyo1SCm9qGb_JMC5ry5DQVt-Q@mail.gmail.com>
 <aHZLvVnNiBcqXdXG@vaman>
In-Reply-To: <aHZLvVnNiBcqXdXG@vaman>
From: George Verhaegen <verhaegen@google.com>
Date: Fri, 25 Jul 2025 12:52:01 +0100
X-Gm-Features: Ac12FXyZSuRHRd-IFK6__wpasUMXKZCQVkzaxu6X84fGcQfro1hcT6PjZAqbpBc
Message-ID: <CAAntYmLn28XD=Zc2ZeCnhEiUuoa9iq-W9EiK2QXY5YfYcsi0cw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] ALSA: compress_offload: Add 64-bit safe timestamp API
To: Vinod Koul <vkoul@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Jul 2025 at 13:38, Vinod Koul <vkoul@kernel.org> wrote:
> You need to add support for new ioctl in tinycompress too

Thanks, created pull request at
https://github.com/alsa-project/tinycompress/pull/29
