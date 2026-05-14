Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513FB34404A
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 10:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778754967; cv=pass; b=EYTvsj4UzDkfymdHG1g/lSkfpa6T0HTa3VfhSC664xyDKaXB96l4zcJXqidmIDfi8NaGmEkYRI1IjI9ETKmupn8S9RKdjtcKg3WdGP0aLaACe6ASGh0ntioQIMR1odimMvvmxQH+Zic3/IxvRbtnhZaobtR6XFS9u7i1vrr6Iqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778754967; c=relaxed/simple;
	bh=yuTk495Vm0IloebmySK+gEVSk8s1hGPzD9oy77p6pxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K8ZLVIKDONmAmScwgE2G5u/3TDtGnHyG/nJccZE6nYoUr6DXzU4qbj1OO5SNosDN/63o0vccsAJrgJF6DcQCl18yonLlw1WoJV3kGgF33rw4Ev9XPhQJYNcb0yQrfaS0qsfsum91H7Ww/mG52OvW8A6KkNfG0DBEhkpzNZEKAxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0Z7mSmy; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0Z7mSmy"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so71759165ad.3
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 03:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778754965; cv=none;
        d=google.com; s=arc-20240605;
        b=GFP0MHamgnjAOUrkgcfhiMNOZZtRWYP6+9hRW42VTTucH97cCwxZ838veJbgijrnb+
         a73Zv1JKO2J1eQkecZLNLpHw+rBWEpUjum5lMfmXJ4UjCoAQf++HeagItgV+Ura2n0dB
         hwiAUhCapWhfqAbzv8zP0u8PQPDi+bPMgfTnfiKrEJSUYE/Mt8i997S1SS4f/UxdNzAP
         Tn1V71J+0EftXCDbY6AnaSihu1ehrQom3GeKjOoH1TixXeBIkBLLLC6wKGW8QCfklC6Z
         h1QyAc6dVaGc6JMHwbHr+t41817VOTvGVMbcjMkAAUgsejOFcpzsoqM/vQOUt2oNoeEY
         6b9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yuTk495Vm0IloebmySK+gEVSk8s1hGPzD9oy77p6pxc=;
        fh=7d8diGF3xEvbWvEB0sVCXbFHdZLcuAGMfC3jMNYuaXM=;
        b=OtFG2yyd7CINXrDV8rdj0Cz4DeF3ntg36/aR8oq716r8jvoOpJuVI4uUcG/P0iyY3q
         9lUtxRMUDpJ7FTMOa0nU76kQUlYveoFXNZthlIjRFZpL6UfN1I25MWonSzxlEZrJNjcP
         xd7i54HK79UFCBJirduA50i997Nlm2sZZ/dduX8sCMYYgA7ctsGhpYdocWeUg5zsv6cs
         y91wZvVZcQjWHtrVETulN2oNwSH/QFeY7bwC9WsOQUNM71k1Zb6xVxMU4XWYJ9kmZHum
         gAtQsBN/Mmv8Dr987+w/Wgy+QUB/sGx8yKggFDCDIurbkERC74cYGsRCMTSNv+bjpGjH
         A4+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778754965; x=1779359765; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yuTk495Vm0IloebmySK+gEVSk8s1hGPzD9oy77p6pxc=;
        b=K0Z7mSmy5hG/IEGEU6sANa3uKhWg1WR/aMLKgFyNscZ1RoNVJ7iYEVLxxIoppe0kIr
         vFoDtygEAM2dXKsas+b0+6+mGgRuC2eO2PR/0TfRQq5cu2NXKf0VAEeesa20fAj0M8LS
         JAsMg2U686Qsr3k32DhmabRZc9eMj5sVo3eY18ZQQtHuvFXVf6+GSaOHu7jc+ILA91cR
         k1Hx+wby7302sFS1DBRz+UCWJcZCYGM1WY8bZ10xhhipXddIyyPqIKdZRPiIwDZp6l62
         bAkNn/OIDooECbZnzc3N7ivABygXzs4LLpkB5FltBdEQRSh0Gh7hrSc4Q9nch5JKpxpo
         ZhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778754965; x=1779359765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuTk495Vm0IloebmySK+gEVSk8s1hGPzD9oy77p6pxc=;
        b=QFsB4ZIm85QpuWV5hFagR87f7lwvJneZ2JOgQo29FIdv4Zy94D1lTegVLz3Sb8QYxT
         3so1+an6tEdk5RzPP9b3chMGtoDzNea+I1K1AuJ+f3KbpvPAIhaS1xAsudc78NPoJb3l
         2AyEho2qcykvfgL9Cs0dTMSySGrx1Pf2KvI0Sd5Kwl2fuTjY5FrLiINIiQM22t6ggkoG
         RNGj0Oea/h4/3HpVQmAMwnLNpOzu5aMnX+T7UJSszJ6fJTfLRJXiHjiTnlYjsEqJRwo7
         Tk0Mhf2sxYIrk4AwTDJUfcGRqmNbozEKlwVaFupT1RFrzmtOM9s6SoU93ugJsnZxqmT4
         WVOg==
X-Forwarded-Encrypted: i=1; AFNElJ8sl5rQPS1oqa2cadXUimrvEMAD/d3tCZtif05GTyFKvGzuPHXfIVu9K2LstenBF/K04Gc7GEdTHOkxbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNkT9M6nFHulE8GiLRnc0FTpkHYZ11wlAH1TLNovKwVg/V/2Wt
	mV0zk4fyc8Os0p0tutelmcRpLk0AQT+VBEFDGWFT2O/XLoszYOaaLzBqlOUnt9oFq1bTNfgsLDV
	hnoqASDkka+C022vw41eKdfwtS7syWSQ=
X-Gm-Gg: Acq92OHBXTx34bMoI4nbxTMbLU6RKU5jY3hLLGWbSS1+fKHCItXaQFXofSIa+Qf+Nfz
	dWF3KZJolRRd+rsh9VQi5tT2rSbnvULrpZCFqDLw0g12OotQ9gurM/jgqre+ZVhZLjY8auFlQ6+
	S8oEQFpRV3P3zSULzZckP6kO6ixGVJS6H7hQTgAe7UEpSyAH8fkd/ZiQjyNWgcHuCa/zQCTRZvf
	dp+5vWc+TtnF+I5+GotqJQPJUDNpWjhNHLBdSCsyPh0wKDqjIEMiGkdcb6rQtPLepFy3u7o2YCv
	R90pcCt6dlky8EqC26rK5/n8nC22MGUvdhEHxQ==
X-Received: by 2002:a17:903:22d0:b0:2b7:abc0:3bd7 with SMTP id
 d9443c01a7336-2bd2716ecabmr78648755ad.9.1778754965388; Thu, 14 May 2026
 03:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508103837.138142-1-phucduc.bui@gmail.com>
 <20260508103837.138142-8-phucduc.bui@gmail.com> <af_g24kqkm4QhDuU@sirena.co.uk>
 <CAABR9nH62K5qqujXzr_HwT6F0V1ezzENAVnjqqu3zrMvmCYWbA@mail.gmail.com>
 <CAABR9nGHO+q5BUmUtER_tcC1drz3bBap-+=pew2+JBKYsg_6Pw@mail.gmail.com> <agUm188qDiaSbeqc@sirena.co.uk>
In-Reply-To: <agUm188qDiaSbeqc@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 14 May 2026 17:35:54 +0700
X-Gm-Features: AVHnY4JM1pWwYl9VeVa0saoplG5zAR_2e0bH1Fa2OQK9QligFm04zKOKs1A98Ng
Message-ID: <CAABR9nFjsxMdzsdHfQ_HmTiM6d7zfjA0=G17pBCDJri4dVU4nw@mail.gmail.com>
Subject: Re: [PATCH 7/7] ASoC: ti: omap-mcbsp: Simplify lock and resource handling
To: Mark Brown <broonie@kernel.org>
Cc: peter.ujfalusi@gmail.com, lgirdwood@gmail.com, perex@perex.cz, 
	tiwai@suse.com, jarkko.nikula@bitmer.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

> That's probably a useful idea.

Thanks for the feedback.
I'll prepare and send the patch shortly.

Best regard,
Phuc
