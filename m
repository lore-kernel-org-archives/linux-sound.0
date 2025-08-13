Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C5D166F1A
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 16:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755101533; cv=none; b=i0hBXvfOSyjVJ2cAIy+6k32mGql3AIXHBVNvMqSxEs6AUe0V8XD9tb5s09lXXP+bC5k874iaFHvo99Oyvo/FhPnaQRV+uqS6U7B14WwWpCynsC016CDQxEgJah7jaj5OUEYWr8psZqJxs2deYqt5LB6sq7LFBZUOLTWjEE95sb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755101533; c=relaxed/simple;
	bh=GDXXA5rGI2rK4kZ3sH7V31G75sW5dYu4fvHA9TMPjAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iW1ehc/9Ek14pMGZB5r4HwbBfKJ/tFKRMupWSymTCGz03S5PKAtQJW6kX0oc0mU921TOrNWU4qTkp8i/Si10rJAZ0xYLr2AZmNQH3yoIMe80sHXVEbX3aeZSt6WbPdsRRDBV96tsu9k4jQptonZZ1I2pCfIzJU/xWy2BhbCuUMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qTK3TRcF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qTK3TRcF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F359C4CEEB;
	Wed, 13 Aug 2025 16:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755101533;
	bh=GDXXA5rGI2rK4kZ3sH7V31G75sW5dYu4fvHA9TMPjAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qTK3TRcF+wkH5LNz/XovVXzxZA3J1Cnn1XzNFzP392Oz4+VaLsJb5Olo8LKLcKL9e
	 n/hUDeSQwZwgotIMMl78GJdda14Kc4cIkhjKXiivCo4t7VHrsQgo0MWNDbU4dOP8/4
	 s3Wn/ttPMf+Bks1ruPw+sXgh92PjOi0onZy1Aku0yK+hXvOzd+t1S2SGDRq96PgLDa
	 dIhP0tabzAXsNxfZJA8XSNEkBhoCagna47APG0OrUHrhhjt3ZSIHiC285TNrBs4T6m
	 ypC0MJImaq66Vmn8GxMbsmKmi2d/lUnOTzPBa2QPmzI3+6C/gCjjgvXtsMP0cvWEUw
	 /NSnrT8xzFtrg==
Date: Wed, 13 Aug 2025 09:12:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/ca0132: Fix compile error with CLASS() after
 label
Message-ID: <20250813161209.GA627603@ax162>
References: <20250813090039.20064-1-tiwai@suse.de>
 <20250813150131.GA2842554@ax162>
 <87h5ybw921.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5ybw921.wl-tiwai@suse.de>

On Wed, Aug 13, 2025 at 05:11:34PM +0200, Takashi Iwai wrote:
> Thanks for the review and explanations.
> 
> But I decided to drop the whole series for now (and fold the fix into
> the original patch), as there are another issues that are caught with
> clang.
> 
> Namely, when you have DEFINE_GUARD() locally in the *.c file, this
> will lead to error with W=1 because of the unused inline functions.
> 
> Currently, I paper over with the change like:
> 
> --- a/include/linux/cleanup.h
> +++ b/include/linux/cleanup.h
> @@ -347,7 +347,7 @@ static __maybe_unused const bool class_##_name##_is_conditional = _is_cond
>  	})
>  
>  #define __DEFINE_GUARD_LOCK_PTR(_name, _exp)                                \
> -	static inline void *class_##_name##_lock_ptr(class_##_name##_t *_T) \
> +	static inline __maybe_unused void *class_##_name##_lock_ptr(class_##_name##_t *_T) \
>  	{                                                                   \
>  		void *_ptr = (void *)(__force unsigned long)*(_exp);        \
>  		if (IS_ERR(_ptr)) {                                         \
> @@ -355,7 +355,7 @@ static __maybe_unused const bool class_##_name##_is_conditional = _is_cond
>  		}                                                           \
>  		return _ptr;                                                \
>  	}                                                                   \
> -	static inline int class_##_name##_lock_err(class_##_name##_t *_T)   \
> +	static inline __maybe_unused int class_##_name##_lock_err(class_##_name##_t *_T)   \
>  	{                                                                   \
>  		long _rc = (__force unsigned long)*(_exp);                  \
>  		if (!_rc) {                                                 \
> 
> But I'm not sure whether that's the best way to go.

Yes, that is the subject of another thread right now, which is likely
going to result in the "flag unused inline functions within .c files"
part of clang's -Wunused-function being moved into W=2 but we will see
how it develops.

https://lore.kernel.org/20250804220955.1453135-1-dan.j.williams@intel.com/

Another issue of the same vein that I saw, just in case you didn't:

  sound/hda/core/stream.c:954:2: error: label followed by a declaration is a C23 extension [-Werror,-Wc23-extensions]
    954 |         guard(spinlock_irq)(&bus->reg_lock);
        |         ^
  include/linux/cleanup.h:401:2: note: expanded from macro 'guard'
    401 |         CLASS(_name, __UNIQUE_ID(guard))
        |         ^
  include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
    290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
        |         ^
  <scratch space>:86:1: note: expanded from here
     86 | class_spinlock_irq_t
        | ^

Which I worked around with:

diff --git a/sound/hda/core/stream.c b/sound/hda/core/stream.c
index 503bb3fcacc2..711da67d7506 100644
--- a/sound/hda/core/stream.c
+++ b/sound/hda/core/stream.c
@@ -951,8 +951,8 @@ int snd_hdac_dsp_prepare(struct hdac_stream *azx_dev, unsigned int format,
  error:
 	snd_dma_free_pages(bufp);
  err_alloc:
-	guard(spinlock_irq)(&bus->reg_lock);
-	azx_dev->locked = false;
+	scoped_guard(spinlock_irq, &bus->reg_lock)
+		azx_dev->locked = false;
 	return err;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_dsp_prepare);

Cheers,
Nathan
