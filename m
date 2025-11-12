Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5E4345731
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762968332; cv=none; b=t1Hxkww89Bb8HRx5oAp2sD32ZMPcFCy9wksvyOPl2SH9PFhKh2+mZ650nhHes4CZYRk7xnSaOPVWL8QwvEqoohnV+SKhA8vf4NdTRLCvtopPhzptYeGd4s+ROdXYqWlXKUC/5UfJ23HB/FBsq1LuFJOmXGRl2DHpScUy3i0vTuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762968332; c=relaxed/simple;
	bh=OYOJXQx/bay3QRd1kgdNJdgiv4E6Yg2DDwWtx0GstKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEvHXL7p/Z1bDTFr0lZ2knlCE88+hBDt4phfmc7/PZWWOepoyF6bipXsCPIMgoTCLBVwUdIVRj+czjMruNH0AL798UIsjkDib6iSWXK9j+TUA2i1B7UymaAQfUxMUfLFHps970IDWaDpIOR7Bx23zdLVzw+3gt0EMM2kh8LlZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=jNzX628Y; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="jNzX628Y"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b2aa1ae006so43268785a.2
        for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 09:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762968329; x=1763573129; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fLXs8CVokNNyf7sAHF+EN7UaZyMO6+J+ZGjUUY5TXGY=;
        b=jNzX628Y9kXSvZ5OOSe5wQFqwvMzQ+IiOlFXSHKAxZ3KMh4f7HEDw9uxKWanDT5NWR
         RCGwznDf0zSw1nN6vJpKTPeKKnTJIE2Vz/VotNN/6Jh6Uz7vHi1a9grTG/WdK1r88HhI
         mCTkVi8DVLgmGEThVoAKeeaACbniEECrG6XHv8nIqhedw/e+uQtr3VKnGAyzScOSf1yl
         NjqQM9HvgWgoF5Qm+BDZqRtYnRre5yZWvGUZNJkWnenuV0fPofV4yHKBg6jzhEKbH5ZF
         1TAibns+IFPI6eT4l8M4qhUEpJMHWJmdzxBz1Y5fd5jIHDkzApEVuQWhHEObOUMVAZvB
         SYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762968329; x=1763573129;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLXs8CVokNNyf7sAHF+EN7UaZyMO6+J+ZGjUUY5TXGY=;
        b=gem0MiTB9wpKFQjImQuLZXthKWnn/nzEKE5cpUDqDjjMkddf7DqcYKt1NG2GOlnGNc
         5xi8ZGhu4fn+Zokncc/GOP6KJup5tvXNrnlxsRjnga25a54hgrcaMYvzlff7SFH5qIz9
         t6GyiQ+dQ7+FvjfhIyCJr+Mb4jo/hXN7eA/GgfBmg4+JVYPoWCpVqockiwFWFA0N2bGj
         wfU4EEFHWsOzBUQSmdbp6dc4Lw0TayeFJBaMMiqx3OvNsNQILC2UCX8inCzrJOOV/kHT
         6R0BztANY0liP8t+HX7XFHN2VrBoeahojEt9ApYQyC4yBmMuccLNdB6owpJ68Zz+TDJN
         xOag==
X-Forwarded-Encrypted: i=1; AJvYcCVcHRH+XG8ObyThSqpWnxl0JgDrBm+acIMAkXBaCwxdzqfuSeABAR6DCMN8npGX+FjD4GPBVOQwGQVtUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB8GlB3xtfK3bhTUNNo2GJjbaRAF+rUlGUeUjsBijkREKYj/Wg
	y5L/ggzk3YTR/LxXltkmjzyETG2YPqbdy1vgNSA27W3M7CX+fDs5CwYNett0uA3SdA==
X-Gm-Gg: ASbGnctwDLSw/zlb3xOcTes+3k9U/KtfeENJu0rbdPw4+vKJ63bCuda10e/I0IN29Y5
	CAoKFQ/aaEzYturbArcx05gK2/O0klvjNv8E7ZFGM7yiCJX0CtKcwFfY+kGm4nTERmmyioJ7pqm
	E/Z1RbO9Qz4Mbp0Z16US0bKOiKWmM/YPoipzIQ4urcG9/Q3Xi+Bs0rwS7crGESHjhm7i6PFJo4/
	rDPV2LCdRSt6zu2/spDLXhZyIrwVxKmITcZCH49Cldw8220Y4alL/ggy2nPxeAq34chPvxPUQkD
	kyFwghkSCFPV/TqxN8t2+IqfrlH3qpWQniNanWaPlFusMewYs+M+DiNfsklElWCIVX4m1tvU34I
	uOCcmnvE4nD8Eq8tdKvo9N5+X8Uf/kmxWWxjYrgYbp/GdNzoD8qpRXxU8h378YWaTYW73AdxXvz
	OUX0c8jAVQxU6QlrjjYsgLX1+0OhDMezCs5TeerNXH/4QUcBmCHJgFB+o3cEXFOb5LC8samwN2s
	iUIRJ5S
X-Google-Smtp-Source: AGHT+IHiovmU/aYhQm59y8iiDlZbTx5G9WMKAnCIH1B6dtt1Bx+dfhQEcbptLPGc2D8z7piQZb4+jw==
X-Received: by 2002:a05:620a:2950:b0:8b2:6ac7:aa4f with SMTP id af79cd13be357-8b29b7f93a7mr459919785a.68.1762968329313;
        Wed, 12 Nov 2025 09:25:29 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-29.harvard-secure.wrls.harvard.edu. [65.112.8.29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b29aa26dd4sm226850585a.59.2025.11.12.09.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 09:25:28 -0800 (PST)
Date: Wed, 12 Nov 2025 12:25:26 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: Rodrigo Lugathe da =?iso-8859-1?B?Q29uY2Vp5+Nv?= Alves <lugathe2@gmail.com>,
	michal.pecio@gmail.com, bentiss@kernel.org,
	dmitry.torokhov@gmail.com, jikos@kernel.org,
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org, linuxsound@cosmicgizmosystems.com
Subject: Re: [PATCH v2] Apply the quirk HID_QUIRK_ALWAYS_POLL to the Edifier
 QR30 (2d99:a101).
Message-ID: <58edd03a-a7a7-40af-8228-18004dc6e737@rowland.harvard.edu>
References: <20251111203350.3c9a669e.michal.pecio@gmail.com>
 <20251112015356.1919586-1-lugathe2@gmail.com>
 <ab81f525-b4ea-4ac7-94a8-9d8eabca957a@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab81f525-b4ea-4ac7-94a8-9d8eabca957a@cosmicgizmosystems.com>

On Tue, Nov 11, 2025 at 09:20:29PM -0800, Terry Junge wrote:
> Hi Rodrigo,
> 
> You might want to wait a couple of days before sending a v3 so other 
> reviewers can get a chance to make comments.
> 
> You should include the HID: tag in the subject--
> ...] HID: Apply...
> 
> The patch should be sent
> 
> To:  the HID subsystem maintainers
> bentiss@kernel.org
> jikos@kernel.org
> 
> Cc:  at a minimum
> linux-input@vger.kernel.org
> linux-kernel@vger.kernel.org
> 
> plus any of the others already part of this thread.
> 
> On 11/11/2025 5:53 PM, Rodrigo Lugathe da Conceição Alves wrote:
> > The USB speaker has a bug that causes it to reboot when changing the
> > brightness using the physical knob.
> > 
> > Add a new vendor and product ID entry in hid-ids.h, and register
> > the corresponding device in hid-quirks.c with the required quirk.
> > 
> > ---
> > v2:
> >   - Fixed title
> >   - Simplified commit message
> > 
> > Signed-off-by: Rodrigo Lugathe da Conceição Alves <lugathe2@gmail.com>
> > ---

One more thing about patch style: The Signed-off-by: line should go 
above the --- line, whereas the revision information goes below it (as 
it is here).  The second --- line isn't needed (but it doesn't hurt).

Look at other patch submissions in the email archives to see more 
examples of the style.

Alan Stern
