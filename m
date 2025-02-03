Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD582FBF6
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 02:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738551457; cv=none; b=Evey+oEpX7be4T1sU5iDJ9EZ+Rx0isdJ/wyhbL5jgEmpioNQcuJisFcRjtAz2s/N8ZJjTE5xZ1chtALM+EKk+TLNReOpEJGsDJpqK9Wfh1L6a+OlUkKj964cYpm1ri7B3A/rSEBh3CU4jKuMABtsxci0heXtUUt1kFFLz5czej4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738551457; c=relaxed/simple;
	bh=oEzDFs1lxpookL+pSDttPzyMf9uEHyCcLd3F2ZMJli4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WhPoqVc/2NKjqRtCt8Bx39fMvibGAVfsvtxObkiESyGQnmoybZcZj4EtY3UJi6hhE1/7MVPnw+fZgvbVb3PCZK7uk56gl3ogoPXcuwYwHYUoKavm098CHDXnolcabuFC+0m3igSGsRw+P2Kw0Ux7hRK5JKBLhWZbHNLZ4o7ld34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LiHhL4C1; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LiHhL4C1"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so7481a12.0
        for <linux-sound@vger.kernel.org>; Sun, 02 Feb 2025 18:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738551454; x=1739156254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEzDFs1lxpookL+pSDttPzyMf9uEHyCcLd3F2ZMJli4=;
        b=LiHhL4C1xEtPLUL2L8pFkxwTc+m0bdUz+efikqYCcJpzZhdr770N+oO4ZQFEb6mf1E
         JFynIOYiYXunfH1C9/sLv9xT9Me9Mw0xDFIcZUxZ2JRMqB5Me8ArxX6/3ctdmr+VC+WS
         eI8upoP+YGYN0o41SsI79+mTek96ddiqbz+pWi41BOrdlagW+Kj7sHHmOHRjXLVMXCic
         wfkNrNSOqNgrWaAM9DiXYMKP12/EYceQY3ikZfm1GcVfXDAG1DLueAGpg/6g49pAzP7X
         jR/BI9uysI9pI3CMJRFCU2xKzRfZNHksQp4geKS67D4Fy95+u4tPnzhNeCsfvrkQG84A
         N47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738551454; x=1739156254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEzDFs1lxpookL+pSDttPzyMf9uEHyCcLd3F2ZMJli4=;
        b=vs6nflwQydSAzQGElFt0K5+7M60G3brYiyIKffk9pUc6yXcVdDJgPZiYVtVZQeykYB
         RcX6Uo7ITPO/yWXnou6ZjURen8tucPGT5lfMykCR4mwPL8H7xgfh6L1+ECcAviHZA64d
         dYTYjpAN9iQ3UPlp4zUGkHRWWRjXz8hvh0uhdcpyU7kxgZoPWRZjlbhIEydRWyeAy4UL
         g4EP489wXdW+hpA0CSbymWhWQQ8kq6aGIEN1EoI4ujlnM2CozZMEeVVmeQNj7D3zTHcF
         fq9NjbSclXnUXuX/xVemNAP44XbYfOYwNIDmd0wWHCp2h1IoK/BCG2BjQKoT6rJ3Jyiv
         y1Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXPdr+b7SHtBuokfZmIG2hKlnj7rGDwsMrmop0BhID2q0VJxHlgeo8J3nP1qD8D+uwnBjWkEg5N5rMh+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ViAWZEYJ0MW9T//Y8tBDDrCHIF+2PJov3OyyCElO5Mlkkjv0
	CHBrxxbFbOWiKIHapEKPOtBL1wI+eq1cgsX7kRloZbLyO+a0TGgl28JZ39FKMUAO7gueP4mX2M7
	ykuqzYnesZB60MOMsZDoFP33vmPGL6ZPTPPiR
X-Gm-Gg: ASbGncvEXffIHVk25iPPm8nEM1OpE5xnXCwbvcS7sRaT+s6STxlGMN+rikeFtrnAvZl
	c7nTHNl/3bjfzyLuIF9rcOK2wVymzMrKNYwwhvCwHc/J+JBsYzm8fflYdrLN/HhFqGYnXO/Yd5U
	N/xjFZIrOIqNFLP23xeQ9DTjpjVI0=
X-Google-Smtp-Source: AGHT+IF7JrZuT9VadDGHDwYrpNWOiZxVM7fVQSarJ5BK/L8psYHiK1IzNqfvJ3STqS/R022ep8JftZGoUuEqEBxsRbg=
X-Received: by 2002:a50:d79c:0:b0:5d4:428e:e99f with SMTP id
 4fb4d7f45d1cf-5dc91ce776emr89869a12.3.1738551453987; Sun, 02 Feb 2025
 18:57:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117145145.3093352-1-guanyulin@google.com>
 <943a7b09-8e77-4813-810a-18fea0e61482@linux.dev> <CAOuDEK3aip9SLCUPOzpVPwx-O4rmF-+sQrF4GJasGPBzV=qJdg@mail.gmail.com>
 <e5b1c3bf-4457-4859-92fc-785f7d6037fa@linux.dev>
In-Reply-To: <e5b1c3bf-4457-4859-92fc-785f7d6037fa@linux.dev>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Mon, 3 Feb 2025 10:57:00 +0800
X-Gm-Features: AWEUYZmglGYEOfj-nWE4mZnVnlY9CRf3vG5h3Gw3rFrIW4r9R0jI5e-8yCDJ_6o
Message-ID: <CAOuDEK2u509kNjyL6qm27QgvtoCscRcsLixW=W8ABz2NF8A-tw@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] Support system sleep with offloaded usb transfers
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz, 
	tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 11:22=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.dev> wrote:
>
> I am not following, sorry.
>
> Is the desired outcome to
>
> a) prevent the system from entering S3 if there is an active USB audio of=
floaded stream?
>
> or b) allow offloaded transactions even when the system is in S3?
>
>
> which is it?
>
> a) would be rather interesting, but currently we don't have any such beha=
vior supported. When the system enters S3 all audio stops. The stream will =
resume when the system goes back to S0. Do we really want the battery to dr=
ain in S3?
>
> b) seems rather complicated, once the on-going DMA transfers complete the=
n who's going to refill buffers for the USB offloaded streams? Allowing the=
 lowest level to operate even in S3 is only a small part of the puzzle, som=
eone's got to provide data at some point. Unless the data is generated also=
 by a side DSP having access to mass storage or wireless interfaces?

Thanks for the question, the intent of our proposal should be (b), to
allow offloaded transactions even when the system is in S3.
In our design, the DSP wakes the system before the buffers are fully
drained. This patchset enables the USB controller for offloaded
transfers during system suspend (S3). To be precise, this patchset
focuses solely on enabling the USB controller in S3 and does not
include other necessary components for continuous offloaded USB
transfers. I'll revise the commit message/cover letter to reflect
this.Thanks for highlighting the potential ambiguity.

Regards,
Guan-Yu
