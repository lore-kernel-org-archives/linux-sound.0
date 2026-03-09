Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92723BD645
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 12:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060922; cv=none; b=qSudZxinC+TcG4vCzunm9hG6Z6aT2wvbp7ZUyoGpxgjkPH/4CV/YtpLV/RXXAEU8bvX/AmIr3Puxo79dEtGlQUkX3M9DO+eHhTt+pNWK1Y1N6Cmhd/bQ5opnTeQj+OkqcfTLDySSuly4IN1KXiaebP6fz8g37mq6BcsFA829PUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060922; c=relaxed/simple;
	bh=6F4tYFxIxl5jUs6uiWf8XdWz74jtj5fTeJj1oAJexMw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dsY/cq2hhcWnjXLiiIB1JGyfB2nxVLTUyKx9nR6eQHgsYcl8uOpevDF01vpCDvsLL0YzIjF5Y6FCmMry6dOBckFM3NX/pf/BeFU14yZ1gogZpeECPI9RS2mXOK04m4GrYAKa/wlviT0ndGQ4X6iG1Rd6Fo3NhUo6mqwDanQD7IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=p8qmf8wM; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="p8qmf8wM"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773060908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+RwK8RR51qXeZ71e+SyZvIcyWk9REBek1JHzsr0gp2E=;
	b=p8qmf8wMnjquqbtDjCeFlkv0g/rwvbNPeTR18zkEYenETkIXumccUggucGa0zgF6GLFLib
	djNVfvGk4X/ruI12bGeiJmIWq/w/TeASL0uz2CUP4SvuXjw4HSrvbgcBOJSUbD//EuWvQm
	6+dP7/V+lRP4TfPb+t+51d5aiGXV3nY=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] ALSA: aoa: Handle empty codec list in
 i2sbus_pcm_prepare()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <87zf4hmcw4.wl-tiwai@suse.de>
Date: Mon, 9 Mar 2026 13:55:02 +0100
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kees Cook <kees@kernel.org>,
 stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <CFB7A246-8C9D-4F49-8143-2883030C1135@linux.dev>
References: <20260309114159.765304-3-thorsten.blum@linux.dev>
 <87zf4hmcw4.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Migadu-Flow: FLOW_OUT

On 9. Mar 2026, at 12:59, Takashi Iwai wrote:
> On Mon, 09 Mar 2026 12:41:59 +0100, Thorsten Blum wrote:
>> Replace two list_for_each_entry() loops with list_first_entry_or_null()
>> in i2sbus_pcm_prepare().
> 
> Hmm, I guess both can be simply list_first_entry(), as the codec list
> in this code path is guaranteed to be non-empty (it's called after
> i2sbus_pcm_open() which has the check of the valid codecs).

That guarantee only holds for open/prepare, not for i2sbus_resume() via
i2sbus_pcm_prepare_both(). It's probably uncommon in practice, but
i2sbus_pcm_prepare() should still handle it safely.

>> Handle an empty codec list explicitly by returning -ENODEV, which avoids
>> using uninitialized 'bi.sysclock_factor' in the 32-bit code path.
> 
> Which 32bit code path are you referring to...?

The SNDRV_PCM_FORMAT_S32_BE/SNDRV_PCM_FORMAT_U32_BE branch.

Thanks,
Thorsten

