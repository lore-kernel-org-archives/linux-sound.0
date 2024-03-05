Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03284C13B
	for <linux-sound@vger.kernel.org>; Tue,  5 Mar 2024 00:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709599785; cv=none; b=FSRVibIDEWGd4OTse9NzueVsw2mYJLTcia0f0yX3A763j/pjjW16E7osjW7FUGyyIoLJfsvFcOumt50IOhHQsChbjlbVeQ5a31C6nqR/R/ckbb1R1tVSsXNg19oOKjkWYp6HfMudimNsA/shIhi3xC35G5qoZUfOhFm9QFTEMCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709599785; c=relaxed/simple;
	bh=9WVlQmVptvNA8tbdEilwPjrt2ycYLORzWedBHBofGSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eC55eOa4GbTST8JLQvNPNfQGClVQeMglYx4UkJcxLnVQAejKRVwMPOZ7lcmP/+MWmFsFPao6EfC6jfjyeo+40eBMGnFIhDDpOz04i5bNO14vdRn0xZF2hzkGwTInmfLe+BrglCjfgh61WM6J56mul+Ph6AhvcnRYzlwAByBrlSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NpFoVN9t; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NpFoVN9t"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dc0d11d1b7so41526465ad.2
        for <linux-sound@vger.kernel.org>; Mon, 04 Mar 2024 16:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709599782; x=1710204582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pLTHWOpwORAA/6xhkm7gAcsqrhyIQwakuqBmkuchlIE=;
        b=NpFoVN9teorfGU/KF65QcgFEwmqsC/EiY5De8VN5YHYgB2oCt/jk6DGJzjEAtvHtP6
         JOoIwGoIdzTx9G3OKy5tuXpzZg+BEYtixuhixuE91x6nvC+jxRUwwxvwbaiXjDmV+1fh
         YmoJa0vgId/sw/tT8vw5ynV7WleqtWRDRQHOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709599782; x=1710204582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLTHWOpwORAA/6xhkm7gAcsqrhyIQwakuqBmkuchlIE=;
        b=MlC4J2FNR/QE9bL+kqpVtBVncC3Zcb/DMur+HWqield5LU/SW5LV6WAuNJFaZ1ojVZ
         gMJEJAyj+WrSk3nawlJrftoj9LFINtx2gjrxH7+6GN5FPJg7+Vd3vSLvs5Ew24bEcfLa
         fZ/a26atrYzaST78IDvUBH9N9n5GnHXuQV5TLiI/TVtUPx5DijkxZhVk/lej8To3pLp/
         l1vhTP/+aeA6rMv7aazDCp5Mr1JQ5NbbDhkzXj+1vA8LInl0GG3m/TKEP/1qXU2R6Zu1
         htSx8XLuMpMMwg4EZFIp6Bv71O7wTmsWZ4Dk+AGpj6kvIkTP3lYDjAjF2x9ZQyJ5cQOX
         pSwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb4C5aYag/NO76wtCPVdkNPum7JZNEz73wdVfQXyJgNngNn4oefftMnjG/joNJ3XdkI900CMrrDUcPhiD68KuiK1I9w+unmYTWm74=
X-Gm-Message-State: AOJu0YymiC0US2iQtt2zFHuMK/ViC4FID1sxcSpI7AZaL6xy0kyTpA0L
	Yi7CX5bY9LttNeSFbdOxCtgte8d70+l5S+sifyiR9hDI7AzV1lEbs0kVAaMLog==
X-Google-Smtp-Source: AGHT+IG+PWHRb3lwWh5ITo9aPOQFlQpXHSOSLQf9cGB4/pQxqAA6tAd8JXNzvJhOfi9TgaJTI+9rJw==
X-Received: by 2002:a17:902:6544:b0:1dc:7890:72d6 with SMTP id d4-20020a170902654400b001dc789072d6mr369728pln.22.1709599782309;
        Mon, 04 Mar 2024 16:49:42 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q17-20020a170902e31100b001dbcf653017sm9156081plc.289.2024.03.04.16.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 16:49:41 -0800 (PST)
Date: Mon, 4 Mar 2024 16:49:41 -0800
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, Mark Brown <broonie@kernel.org>,
	ivan.orlov0322@gmail.com, perex@perex.cz, tiwai@suse.com,
	shuah@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
	linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH net-next] selftests: avoid using SKIP(exit()) in harness
 fixure setup
Message-ID: <202403041649.51EDC22DD@keescook>
References: <20240304233621.646054-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304233621.646054-1-kuba@kernel.org>

On Mon, Mar 04, 2024 at 03:36:20PM -0800, Jakub Kicinski wrote:
> selftest harness uses various exit codes to signal test
> results. Avoid calling exit() directly, otherwise tests
> may get broken by harness refactoring (like the commit
> under Fixes). SKIP() will instruct the harness that the
> test shouldn't run, it used to not be the case, but that
> has been fixed. So just return, no need to exit.
> 
> Note that for hmm-tests this actually changes the result
> from pass to skip. Which seems fair, the test is skipped,
> after all.
> 
> Reported-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/all/05f7bf89-04a5-4b65-bf59-c19456aeb1f0@sirena.org.uk
> Fixes: a724707976b0 ("selftests: kselftest_harness: use KSFT_* exit codes")
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
