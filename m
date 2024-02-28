Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC4515DBC8
	for <linux-sound@vger.kernel.org>; Wed, 28 Feb 2024 17:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709141973; cv=none; b=Ptwk5XiYmBJg1uhG0XCWWawhnz6MSbzhl4Cw1xVJP4JiBVCXV778qzt5Ui2NRMbqQsBQDt+eQ/HYNtlE8sKsiJ3z87FOK6TOmE8cHNHKnbhzPdZSNevhuuswglMAEkxI4J94buE6Xu/o66dkVBLSxWr2sknTCF01/xd608dfVCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709141973; c=relaxed/simple;
	bh=QC8X8RLJg/EcMAAM6B4fCWDSCW+dwBVTLUthDex9rDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/7hIj9IMHOGYJDtDV8wKM9NCDfCfQUIuNAJPHh1uHrHBS7TfdCX52kIxJFXx+Sn8IPM9YQrmW2EGAlwt0suAMa+2wlwlQs+WNlWw8HmozXFWUy0PVwozMj3+F525pvYavUlMycYMh5KONRJAgfR6YRTurtmYauHa3kYHY26K/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CmrImjj2; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CmrImjj2"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-29ad73b4686so2314313a91.0
        for <linux-sound@vger.kernel.org>; Wed, 28 Feb 2024 09:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709141971; x=1709746771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NODDRAJhqWW7+B+ilVMpkZpvr1dJVh6fzecoPQ05aGY=;
        b=CmrImjj2aqfntU7U0gcG7SHvevqf+uO71X/YwqojTsy2H0ulvOGGMhj9hnhOg7ntYR
         O+HuVbSzj6jVauuSSX2aSK/x34vd7iMFJhNxrrfugi2fqqB0ZckeDGvklPjNcBSEf2Uv
         YNW80ZATRm5WtR35OE0SUB+V0Yocmy6hl9NEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709141971; x=1709746771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NODDRAJhqWW7+B+ilVMpkZpvr1dJVh6fzecoPQ05aGY=;
        b=S4bwvDTQKiwpXgOE58pA0lozNsndUAQKOmSJiW++FIbnDSjNjGZtL3DOdYJwooqYJC
         HAbiKeiGx9QBpvGgZVMg1JdMFEcDwUNb2gUdHACGCZnQ38Cq6Qltp9aT2jSlzxXfjGA+
         Jr4X9CIGRqlp62VMIdVEnl2U/YeytM0pYmdaVVqfbV1DJ2wQGR4GF4vNEZHHqO2A7P9g
         9TEv8FC+J0McjrN28tIWxtIHPqFhH8vxrI6+VaWDXzxfQIl8+BzjToKepaznSarWpkF6
         TtElOqBBH1NztcG0hbMUvh9y75RIOZtY1VKzSNullz6p6hMDs5ij+cV9OaowSlS19Oid
         +aqg==
X-Forwarded-Encrypted: i=1; AJvYcCVlsF6GmReWk/0SkA7VJanSfZu9tT2MfqpiLBBXXWCKh9RXnvTzhAOv+a1OCCngQjH6cysH6klIWs70dGbv29FpDQA9377i3hudcQc=
X-Gm-Message-State: AOJu0YzTOYlIbKymOPrOWlFMK3XZn2Jj0UNrSzgPvCrCLNGMWl5bo3S+
	TJqbZczytiHaKWkHCIiOQlR7Uhhzh1eg0YwB3YqxNOAF6gzQ9Qsoh0M4lMTzNjqFoFG39yWwXqY
	=
X-Google-Smtp-Source: AGHT+IGp/woc+TexLF/WvhjGKbASp59EBqxFySULqYfcyiys7bw1alzskx50yFi4SAk3a5wWSI6Icw==
X-Received: by 2002:a17:90a:cf8a:b0:299:58af:c873 with SMTP id i10-20020a17090acf8a00b0029958afc873mr400790pju.10.1709141971163;
        Wed, 28 Feb 2024 09:39:31 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id sz3-20020a17090b2d4300b002961a383303sm1953273pjb.14.2024.02.28.09.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 09:39:30 -0800 (PST)
Date: Wed, 28 Feb 2024 09:39:30 -0800
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Arnd Bergmann <arnd@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Clang __bos vs loop unrolling (was Re: [PATCH] ALSA: asihpi: work
 around clang-17+ false positive fortify-string warning)
Message-ID: <202402280925.5B709A60F@keescook>
References: <20240228140152.1824901-1-arnd@kernel.org>
 <87msrkhcz6.wl-tiwai@suse.de>
 <1265517d-b98a-4ec6-9215-10cd988ff78f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1265517d-b98a-4ec6-9215-10cd988ff78f@app.fastmail.com>

On Wed, Feb 28, 2024 at 04:03:56PM +0100, Arnd Bergmann wrote:
> My first thought was that clang warns about it here because
> the 'u16 adapter' declaration limits the index to something
> smaller than an 'int' or 'long', but changing the type
> did not get rid of the warning.

Our current theory is that Clang has a bug with
__builtin_object_size/__builtin_dynamic_object_size when doing loop
unrolling (or other kinds of execution flow splitting). Some examples:
https://github.com/ClangBuiltLinux/linux/issues?q=label%3A%22loop+unroller%22+

Which is perhaps related to __bos miscalculations:
https://github.com/ClangBuiltLinux/linux/issues?q=label%3A%22%5B__bos%5D+miscalculation%22+

-Kees

-- 
Kees Cook
