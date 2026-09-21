Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5BA4FC320
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790024443; cv=pass; b=cBsCb7KKkAY4wdvCmlz2rQ1AXNs9Z3lILo8OHYWHL2AZehmDPTjmNyCndJO12zEDOXcpMo50gOteDpEx+M/+Ok4Jvj99rzOkr8g6MON7ReCDgCbXqLpIcuHxsn3ycon1u0HJBLbxb+whCH0NkZXhTkgS4dkKsRVSYzJssEw+xHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790024443; c=relaxed/simple;
	bh=B1hmclWtNW5qs7gv3tUrEGmKb2mu5k2O0/3ZJaObbPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sx3alDtM1vV7rUaQtt5SCw187MD+sm/86Io5V++HglQhO11OFt1OfEgH3FZ8RK8p4mikvv4vhF1S3G2Fsk/B/9lLUwwqa2kpV51uwnxthRNM6b9n/XEnhMo2Vd3Ps76qEOJe/Zacah6BOqV0x17X0YKIYubFpDh2cetU4YO5JoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gf1jmbwB; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gf1jmbwB"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-89666eea29cso25290067b3.2
        for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 14:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790024439; cv=none;
        d=google.com; s=arc-20260327;
        b=Q30SAnBJE6CrHcNVfrC0z2CRPjOQG8pJxTrvkt8iz5j/+8AXMY8+AitBeVDKfd7Ppe
         CyQ4ZT7j9Atg2zVMV8YZT1hqwBUaLdsQ+j2cl9IVFSb8KQWBwV4njDFh7lB1AnB9CmFZ
         4a1n2BPB2BMUsETZVl4lh+/6RxXBdWDghgKxCpGd4zdHMRaeQceJQE02yE3tzb9G8RtF
         GYrzmnx776DQd826GPXK85JjPDNPa5sK1kWvE9m6VHgx2C9jjXhR6NLhn2CB10V4Q6ue
         ht5QZADXYOYbwJFUFHumvoSPhyhYl5S2ZfWuZ/JbU8IDK7I7/vrCR1Bv7LvQ0slEaCGQ
         mYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iaWbBV3Z3yhSOyCQfwk+cCwWzxlbdn32GHZFoxrvfbI=;
        fh=KILSrooDOzri1TXgvX4euE/bj530p3FwvG10DS0pKso=;
        b=ekDFVWlEb3ReWQNsbyIl5ZxI1pZhz5xB9GygXk9kkOzXlQ5KBIS09I9EVb4cg92CsP
         4wA5ryxtmlYtpXlOlgQuDIMRqu9pcsM02bdTefpMHDN/u8lrdVkilSY9T0TKv0pwEAFJ
         yARG86QCqQ/znf5Rx8Y64OQlmiahT8IJRG7U/gYC9glX7vQL0QvEj2oah8s21F3mx+H+
         SGUiQq4aKbvAnfameVH5dwbR8M3u1nkAQafxgXhbKvufGY7sSroF23I61mgjhQ8pP6Ww
         qSeQNpdfBwCa9h2pVh45tPYhaKPJA/2zEq3qIuitF5dPduptfcx+gsOJNLcoCNMpbQa+
         o8DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790024439; x=1790629239; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iaWbBV3Z3yhSOyCQfwk+cCwWzxlbdn32GHZFoxrvfbI=;
        b=Gf1jmbwB+MVQzoGKFbVMx7QpxX59GMO0+lUhtvRUSm6Y64y8J1SolLaJllUWpXIBWF
         RFLrlw0d2zhml/mYkwJtUZB3fT9MJ9C/ZOi84Yrgcq6tny+DpC/DpJiwT+pDeY7LdeVn
         TR8e1RETFf64futJQUpluYOPFnbf9UOw5l4O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790024439; x=1790629239;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iaWbBV3Z3yhSOyCQfwk+cCwWzxlbdn32GHZFoxrvfbI=;
        b=y1JjPemC4WwYRKtpFx9r5Ct70bF8olURT3qcCGSnpf7YRletf8zHN8HelB6QZUNtyW
         V4wI8rGOXzSWmNuusbVk07mKMcX5LDAOq9fuE+sRAH86Nt8txdlRahfjFEM9RjNoPgTQ
         7qSgmjTFTKLrX2hYL59RnfuuaRKgHy26vF9IoetFFVWs6ZNcrCVdts4nfM4lT7Iur3+Z
         dGmInYQ71F9gpEZVZVoiCTw4Ag1ODgf/5trOMnuhip9dOuHiWeMUvZgNPS9AO1cuKlUr
         OZLOO3lXHDcwHQu5YOI8yUzDEcDC7D6ueVOqEaGvavz4Ejh0oWRBqPmCsr0wcBc8yyWo
         K5/A==
X-Forwarded-Encrypted: i=1; AKwUvBwvrE3WQT9TS3Ovqr2u4WhsE9xTb+SdJFO+PZ+SPUTdl/0LA0nIfec/hZQy0NAVm2RCpsu4jVAHtgDmNw==@vger.kernel.org
X-Gm-Message-State: AFuF++kmrQ6bOwL2uNpBZFBYc7f3DalJbGJF3PdCM4ZvN9F1SyPVN82e
	gqh8QDqm9rF3Nvhg20VTyBM4ZklH4mZ3oITa/jJz2VPnUl/QfZzbRHx+DD/NfRLGGdt5lWvaL2n
	d+k27ftlqHmuztRpoouD8WRxk180JwWQwadocfBsj
X-Gm-Gg: AYBFou0HQvY4xrOl9cUnS3vrwtiBzTX15e11+7EOlDzA1RYzMP150stc8MXm9a9MJp7
	F3q1YCX/OEZDc1mWCl0BWH8xsb/EQ3a7OHt2DfdR5Vo79RXCN489ERTyskmegp+pWxZQeP/7lSS
	/VtFSf7vdjBSNqHSrZpEFNFKPv5UCLOSELSpxyPwe13OKHuno6123mxwMGx7TExBt7GMLWcqoyW
	ff0uFQq7kQM2QSAS4Umk/mDP1EjRsEtgjcV74sjhpeBefBjP0VjT+BR9oSQVZEdDyGqFRj5pBM/
	SFYl07qHXj7llzntNeovLW3n8F9yFoMu2NsfQoM/5FqfrYgEvLoZBVDv
X-Received: by 2002:a05:690c:dd3:b0:884:b55c:a8e with SMTP id
 00721157ae682-8973296df66mr33908207b3.5.1790024439462; Mon, 21 Sep 2026
 14:00:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-fix-headphone-plug-cirrus-dell-v3-1-6dc555b00f61@chromium.org>
 <87fqzan7jp.wl-tiwai@suse.de> <875x05lkfl.wl-tiwai@suse.de>
In-Reply-To: <875x05lkfl.wl-tiwai@suse.de>
From: Steven Kendall <skend@chromium.org>
Date: Mon, 21 Sep 2026 17:00:28 -0400
X-Gm-Features: AcwNN1Vb4N3kkjvSCO-RgAi9ZdBd-0DzOAUMcQlhGqGdJPcF7naJQsHmd3vunJE
Message-ID: <CAB1bpFDsVLApsW6nYOyLQYx83o9NpDrpKwoK_4KdoCV=GeWv=g@mail.gmail.com>
Subject: Re: [PATCH v3] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > The code change looks acceptable, but the patch description gives too
> > little information.
> >
> > And, should we apply it unconditionally all models with this code?

I've submitted a v4 that only applies the delay to this specific model
I've observed the issue on.

> ... also please check sashiko's review
>   https://sashiko.dev/#/patchset/20260915-fix-headphone-plug-cirrus-dell-v3-1-6dc555b00f61%40chromium.org
>
> They aren't always correct but often give good hints.

I looked over the AI feedback and I'm not sure what the best action to
take is. It seemed like it was kind of a broad criticism of delayed
work in general, which already exists in the same file. Now that the
patch only applies to one machine and I've tested on that one machine
I'm more confident in the fix but I'm open to doing additional
testing. Or if there's some tooling I should be using to make the
abstract "timing issues" more observable I would love to learn more
about that too.
