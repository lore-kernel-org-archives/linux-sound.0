Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71212BA2D
	for <linux-sound@vger.kernel.org>; Tue, 29 Oct 2024 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730209662; cv=none; b=XaEw8LlXrpUjvIUXExwqDjizwUughaWFHcFJEWx+HVx5epmTA/HjHoQjN9hrcxYaEkcQto3i48EXku91IwHPhS+iLqKO3U02M9RZy6XSLpDBT+LmTKEHVwX0UMJnyu6+9E8GlAXsFlmJcnHVcHYQeuzrzXV4En42/lNhpZ6g99M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730209662; c=relaxed/simple;
	bh=MuX46C0b0u91A82k45hWka6IQnP6qDFX7xp0m0U0xog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaJNY7RgSOMt+h8fc5Xt/6Ersn9eoF+9oufclUYch/rp7nKJdU5LLxoYd/A7bOia7ivnsGCnovXsw4h0WghwqmfZ9GpfpvH+xCn8jJZng9DCLnF6x6nA/C/UzccTCq3uNgVctj9Tpmz2tLzDPJFv62grukf7yphDEJBKU5+zEk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wb4LEH2G; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wb4LEH2G"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so50439205e9.0
        for <linux-sound@vger.kernel.org>; Tue, 29 Oct 2024 06:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730209658; x=1730814458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MnilKf+1LggrXw/pxXpB+USKjynDFjlh1WwCMDATiQE=;
        b=wb4LEH2GXw8U+WcPtMdDOIUs7P62k6Y4kv+fJKeyZkY/mE0arHNR0b63r33KD3XeYT
         ID9SjMD1uCn4EuoJhqWtE64sIPBwIlKfrJpoWRx8QraAhTnnpfz7AhGlW8GR5+QA+LC6
         ednE6xLIuM10TmOKfd5TS+ILBM8L3x0wg+pDKTNJq5hiBf9P00bLsPbu2KjIpraeT+RJ
         Sy4146qdGZocP2yk1Yi3OKD1ME59/+IE8Fb7RMcIQbHHFBKHIZ3uRbRVF4VSLxLve5es
         8PKE37WkaQbzcPdYjz/yOIX1Ctl1aAILHtxa6UfkfMUnQkbLQX46YLgU1Hb5zShUcx7B
         +hPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730209658; x=1730814458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnilKf+1LggrXw/pxXpB+USKjynDFjlh1WwCMDATiQE=;
        b=ZOGhi+t0QxpeVlyutsLva75Wf2NoaENM+esHDjW8ObwNPz1/XMQS0bwHbVESDFZAV3
         g7IAjirm3dymg1hbkn/dWUOv7RLyUNhOp69xMD9ZQYCJf+kL/bnBlDIx/Pv0j5SZQvVA
         4nYdrdnlCdIBdcQdoYopvkadvvz3qDtCqUeDgsc6EuLFFgSBGqJqvNWJJ0FxxMTuoWpL
         vtsXL3434HBFy9IbtjFXgx2SpiyFRLJHJ22CWP8KAkBdXzXWok8ea7qe82SAX022pcfA
         oDgolKZQsPHpuYQucnM/Hw7YBXPIxi+Ep5Ct/iRvymOrew0Sk+aPw9eXT9+5YD6ofOvv
         7qdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTyeRZSwboBTYQ8/hDvATqhYJSXdvqNzIRDOvc16Airk1OqOZg0q/mDk0orfmgND83vf5iBy9vW9CcVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDpCUAHhtPWpVafXVb4pYj+UCjlaU5KKnZ4TrtrmlYbUpzmlx3
	uf9tZI2n1EsFjE2WwAh94NSyx2C9TA8WPMvUEWhEilgLbqIqdnSbyFPMYR8W0w==
X-Google-Smtp-Source: AGHT+IFRicCdvu+GXyC4D+ImhbhvYd6aX8bPfpuSw0QRQAOpKsrjXWD7uCi3UbUTKpUo37D4ocP8/Q==
X-Received: by 2002:a05:600c:3b94:b0:431:4e3f:9dee with SMTP id 5b1f17b1804b1-4319ac7409amr89860875e9.4.1730209657614;
        Tue, 29 Oct 2024 06:47:37 -0700 (PDT)
Received: from localhost (65.0.187.35.bc.googleusercontent.com. [35.187.0.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70bc1sm12652018f8f.70.2024.10.29.06.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 06:47:37 -0700 (PDT)
Date: Tue, 29 Oct 2024 13:47:34 +0000
From: Aleksei Vetrov <vvvvvv@google.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ASoC: dapm: fix bounds checker error in
 dapm_widget_list_create
Message-ID: <ZyDndtgj5vKo-wvB@google.com>
References: <20241028-soc-dapm-bounds-checker-fix-v1-1-262b0394e89e@google.com>
 <28ade5d1-d13a-4388-bd0b-f03211937abd@embeddedor.com>
 <ZyDlAd-Z26wnhZK5@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyDlAd-Z26wnhZK5@google.com>

On Tue, Oct 29, 2024 at 01:37:09PM +0000, Aleksei Vetrov wrote:
> On Mon, Oct 28, 2024 at 04:58:58PM -0600, Gustavo A. R. Silva wrote:
> > 
> > As in the previous patch, this should include the following tag
> > (and probably CC stable):
> > 
> > Fixes: 80e698e2df5b ("ASoC: soc-dapm: Annotate struct snd_soc_dapm_widget_list with __counted_by")
> 
> Thank you very much for this suggestion! I didn't understand how Fixes
> tag works until your comment, but I've just read about Linux stable
> process and it makes sense now.
> 
> Sent v2.

Actually, my reply above meant to be for the nl80211 fix
(https://lore.kernel.org/r/20241028-nl80211_parse_sched_scan-bounds-checker-fix-v1-1-bb640be0ebb7@google.com).

For this fix I couldn't send v2, because it has been already applied by
Mark Brown. Guess I would need to send a separate message to the stable
team asking them to pick this patch from git.

--
Aleksei Vetrov
