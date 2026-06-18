Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7CC38945A
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785225; cv=pass; b=YEYno7PjX0jjq+U1lexWXKihmJHXG3S32+8bgC7Swv3thFL13B5Mcx/AzmEmXNftdJWx1Uwnp/NUFg3RVT7WMyT694qxnBv7qaBgBboIa5dt0IvgjGDl8WnJw+v+0Yz+vjqY1TwW93ax4wTg8HkaW0lNDfs5JYiwzB8BlEx5ffE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785225; c=relaxed/simple;
	bh=kaE2PgsqZD3/2uO34Ep/Q8xES82dEYmZIO1PW9ncfL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snhvnTNYt22fCb2azljHeQdI+4BkCPiatW8vzmo+f20ZYlmZ8o3K9QWuh/L+0tdFX+/ldjYmeKJMRHcHtMIPv/7uXuHNHnPG+LtJHbMTln3OxIaF6nnexE5T4o9vNHeZPpDiN4OCyqGe4oZajxpTjP128RFK6W6n+2IzyZ8yU9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9mLF+9+; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9mLF+9+"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-800619d5e7eso3885897b3.0
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 05:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781785223; cv=none;
        d=google.com; s=arc-20240605;
        b=Nt06H+hFe2+KXF0uYFVnFL9wnatKuqW7MIa84kELYsgx0FI0Kp4HH7tQ3CWFgCPALA
         +pTE99AGcJDMqc5vPL/qYx+DADp1koux16chXdkY00Q92MXnSo/PHcQNEwEcVDLsjX+4
         89taXrWWwxpeKjSQ3HgsfgrxX0+bhcc9LbfZhw/FakafhczaZtpNuobYc7Pz8BwjVIAK
         12fFDcojiQ68qZewThBIg/3jX5t3O8JV0RaQOTniozvqX+2I5NihscrERSBUSXOHBw3o
         z8cDYwdUtNYqmHIuItPf8D5+rP3p34lYZLxhoXDglUKjpJzv2GmRS1VjumHLUg80jJfm
         vECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bx4ZFG8GxLIXi7MsNfWAQYBwp2+Z1B+lFH6+wXo8bD0=;
        fh=Sla1N4Zi9xqFL+6YI9QlQ7pZftwmJfRd3buTBq+gnFI=;
        b=SVYcaBSEyT1T+3KVEufWqI4ro1fa8TrPRDhXti9huBSrDNHaz1kZMrdnIOD4yD0TbZ
         vj0LlV2bAZwoqzlO/faJMJbxmDLou4rulMJe5B4WZDVAEKEcqsx95EWMsF2Q26ZAy47h
         STHG9Z7295aXDuLbOrYM1hdVVMJIRe9rrvYJPcBHxdpFbP7yx2k/P3wwqqp1Kqz3BN4D
         F/phXvdICojjx1OJsCcYv9aY5TYD2EoadSmOHa2om2cQQE4ske/7OKhiLpY84UJDHpR2
         Axa0hv7j4K2EAbiAsoBfPQq/1oihxb/SI7jaojCRcrCzObAFbMFNntZtwvHn+jb+Qht9
         CqdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781785223; x=1782390023; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bx4ZFG8GxLIXi7MsNfWAQYBwp2+Z1B+lFH6+wXo8bD0=;
        b=o9mLF+9+qc75XZto6uOD/rwcRE13biNzVt7ybMb05qAe399JV4OjB6UzwCK7Fi+1nG
         qIiwLbYGvQiocRymFUR8dWCQxkso++/MRLqATTWiTemHa7j1M8EEw3Q3dX4KXdPgDv4T
         ufd0lEtNCy2c80ZPlT41Mw3z+Dskz73OlPFUhaoRaXT6Ya62jEL/ErC9FNCO3EuGdNoR
         VVwhEnfpGrbXIdU45fvbOzRFqbnEnnH0vmTve3gfxswKdYL1gzrQ9BOGxuzhfuXi7IVV
         do57kWEGdpjo2B31DMAEWdvXdJPkvMqNGnh5ruu9z7YC80xus+ZsYNVmUbKBhyu0eaQY
         KqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785223; x=1782390023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bx4ZFG8GxLIXi7MsNfWAQYBwp2+Z1B+lFH6+wXo8bD0=;
        b=Ys6NF6L4JZkWSNxFWy5hwT3lw1/yT51seZYtFBnxDXNjLI7B4NerSarNraDulugRHP
         5kw5xDMR4/GDh1L8f7G53Q4zj7dKnSAbWRafhhF8vMIhkTj/c5YBg2sd6McRCXa3Pj/w
         0GJdYAw/S5qfYkzCGIFpGnfoxRIQbMI+2Imo5W3IEkUeG8PQU+YNj3VHjORHJhXdYg+a
         /ukUkPmsIRW4R3P5hyxs1ahs+GO0x5+IFs5FiwRjsUWT0uWKDxGGiOR+IrdNPGzD2MvG
         ybdr8BD/f7WlBFEgWjc6EGQMzFfv/4vqV8fBAplX9KSaUpmMfq2JvUScaBO9D2Qc3d99
         hmJA==
X-Forwarded-Encrypted: i=1; AFNElJ+9u8vewz79Lo5OMfBdNXya1X5VZv0fQBM/n1aaVs8sapq2Kmf/q9cqaYi0yjMJ/kxKBtlAL5Y3qq2hLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlwNRD2CBAHVcbBYMapjLmr9F5jrbJ42FFaxarVg7Xi0WcbnFd
	t9ERPebuL4FOu0/+axNUBcl8MkA1cuvasyhUMszfUxjNGvXjWCdeSJ9v6KyLc++T1B0FfBiIa5p
	mPDhkjX8tD15z20+oJQ+2epTxxDD2cm4=
X-Gm-Gg: AfdE7ckiiNpZtqV+WumqaGA/AIGgKT4xUMFWW7iHSzs1cdXM+ZQhhnQ+NcEND8Ks7Fa
	iwuu0VkgG8KlwZK1+KuGV8mBEgzab5zL2XLovqKAk2AWJBRWee+oShyxcGEZnBF/U/+iq7WtoZu
	GQZSI269kKOHLHFXEq+liqfqviOlqo94iByHxv4jQC9uxpFAvRRd7sCXjP0uzEik9wzwAb6j0NG
	O0qSoZNF/x03IwNC+wW4byX8dFUpimuzoK180iJgEeFw7QjBIwQlH7jIqBlqkjLkI1ssIO+gwri
	LNc4Ilwqtw==
X-Received: by 2002:a05:690c:c532:b0:79e:8299:7505 with SMTP id
 00721157ae682-80024e17b8bmr24133097b3.6.1781785223608; Thu, 18 Jun 2026
 05:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618100227.3289790-1-zzzccc427@gmail.com> <87h5n0nnpt.wl-tiwai@suse.de>
In-Reply-To: <87h5n0nnpt.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 18 Jun 2026 20:20:11 +0800
X-Gm-Features: AVVi8Cd8dxl8EZ1NPK0OjKRxsLIvqNFh2h5tsJCA2wJyfWZeqWH7qUKd6TJQ_nk
Message-ID: <CAFRLqsU66j=u-m78cSDug+qqCncsvFug_S9Du2yeh9iZ1RTBhg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Kill MIDI 2.0 URBs before freeing endpoints
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi, Takashi

> Thanks for the patch.  This can be good as a quick paper-over, so that
> it can be easily backported.  But the proper fix would be rather to
> call the core part of __usb_audio_disconnect() at the error path
> (something like below -- based on the latest tree).
>
> That said, I can take your patch as a quick fix, but could you correct
> the patch for avoiding the doubly disconnection procedure?  The code
> should have a check of ep->disconnected, such as:
>

Thanks for your review and guidence. I followed your suggestion and
reworked the fix accordingly:
the common component cleanup is now shared with the probe error path, and the
MIDI 2.0 endpoint destructor keeps the ep->disconnected guard to avoid double
disconnect.

Best regards,
Cen Zhang
