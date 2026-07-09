Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71BD4071EC
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591679; cv=none; b=YLC1KzGjQmg0LEYN2ivvXfSJUTIk76iPC+XL572oQ38FJp3YIHMbZe3rZ8B8HeVujtD/znNBBJtyUsfiHwG57U0P+f3tap6UwLK2TUo3xQyCodtYnFd5calq+ioxLOBHrqQkeDXYxnszbE3NrF+BuiaDvz+toPY5BN5Qr/wtu4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591679; c=relaxed/simple;
	bh=gDwGo8DP/0imjy26nD3R6LYtAXIxD222lR1V6wozdGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jH7gKMGdsiaN+4R2X/rHr/N0EnkxFIHjsAHBK2KkCurpgy7ahgrXYis1gKM2jrY+nvZPUN3tGD0rorzYAZABP7Dcz3wIFGQIZagvD6DnTAVrC5aR4AkaNEr8f3+MyKbuJJMpmA9tJ0FGj5f9hRiPZoAMmSiD25vZjmkloZfsTMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ez8buYJ4; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ez8buYJ4"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb42a2f5feso304904a34.1
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783591677; x=1784196477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DwCLb0ckE+tVbANtskaKFVxURqFo9s9DYGaLtVSy90c=;
        b=ez8buYJ4TWRETFhOhFit7a5WOgBguv9sHOnkvRMTTWK8TLL9WMUQqz1QNJ59dcyNAD
         Up0ZeRfvt/ePaHzDKj0cgaph1kxY0X9vOy2F8OJxEaVVtPN9Ie1DOzhsmuTiBe5iz6qZ
         JtpdecfkVMKGkm5jBCNDrpwdr+bK7rrRybsqTNHV5ywxDjj3AAfujI3/o7m9s9Ea49x6
         7oFiDPPTHELzjzfRZ4S8kUupN8Hq8WMPmYsbFLu6fOD1n6CyJz3DgwXdUpUt5ia6XWsJ
         p20idzBYPvINF6g2dZjKvg/yf9/E1X9cEIK83HKZn01Byc1gcXMRiTWb6AgGXJwnPFYV
         PePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591677; x=1784196477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DwCLb0ckE+tVbANtskaKFVxURqFo9s9DYGaLtVSy90c=;
        b=UscfusD+5SvB973Ow8IcgDuz8B75M9Di2uu5HKK9Fe4bZ4AndbMZQytbks4TYJeyCK
         bQ8XBpCadHUz45o3fP3yf1wqVftxiDNbAgMGD7BaYEjQJ4FLL/huTvHHwQ44lYilM7ji
         Q2pltTRAKywsxNWp1lDMvL56R0qim0iM5RDEavo1v5WVPQyTEuHQ6Lym7XPN141FThtR
         nR7x8EmDK7ngE+VryRfD4hmY1JIbafybuagDLB2QUGRck+oZFAEFYtdeFF6wXiRN4ZbI
         9oTDymijjcpRucCeg4uRH0ab6/JbuZ4DqDj+4Dnb8wCLJyBQ/QAgR7Z5n/EkZxbCxUG7
         yQCw==
X-Forwarded-Encrypted: i=1; AFNElJ/07rrc1O44d6OTJSIP0OKbNhicRPpiJPNR9vdko797LsLFcDf+JtnOnnJnK01rAhAl9Af/2Xtk8uqqIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8FbteNBc1jC78j3rkB73VpBWq4L0fVh/7PwxzPSRlINHRmnej
	Xp2D3/ul2DKWKxwR10k5TDPWGaxc7as1gQuqjGzcV8X7obhR/uDQ/fip
X-Gm-Gg: AfdE7clu0tdiRf8b0SMTyQslRE1St8QOsp2G12Dj7poRv4uucCUL7bNBklRl2uCXIyt
	k0Pe8g01TqSYj3IJMGFJJ9RikW4dCndEqRs5eB7SEvQ8vTqMPRFwaq4+ChehA1AWGeiq7JTWC0k
	CF9Z778Sv7OoPJbc7h+bfoHQl/S06uK+FMFZLU/Zu929DNaElDU3qOTAZu/ScMF0mAPtvQyqlDy
	JM4g5inOSNLjvXmhQRLwt+gJ9bMO19xo24JwfitwWdmsks52yuio2uHo0RQKg5dMmvmL10INvKI
	Y7yb1jus15ViquigrX2CKXappTp43s8k82RnliWM8KeE82GiIuwYIh9ECCOll9kUuhsmbqOFjfY
	HvWH9A59h2h5JcpkkeMQ5eg+SME2fMmrTnyOFRAdTyzgWkesWWWWkhdePiyPb1R08uyPszPmq9+
	MQW/sh
X-Received: by 2002:a05:6830:6d2d:b0:7e9:f8e8:d8fe with SMTP id 46e09a7af769-7ebcffcb5a2mr5065564a34.24.1783591676690;
        Thu, 09 Jul 2026 03:07:56 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcae177c5sm3879123a34.5.2026.07.09.03.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:55 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:07:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com, Kees Cook <kees@kernel.org>,
	Cen Zhang <zzzccc427@gmail.com>, Len Bao <len.bao@gmx.us>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: oss: Drop redundant nonseekable_open() return check
Message-ID: <ak9y9Nlxz2lu4ObE@stanley.mountain>
References: <20260702050236.30751-1-phucduc.bui@gmail.com>
 <ak9xV8VdUT91gHZk@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak9xV8VdUT91gHZk@stanley.mountain>

On Thu, Jul 09, 2026 at 01:00:55PM +0300, Dan Carpenter wrote:
> On Thu, Jul 02, 2026 at 12:02:36PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> > 
> > nonseekable_open() always returns 0, so the error check is unnecessary.
> > Remove the dead error handling path.
> 
> The idea is that it might return errors in the future.
> 

Actually the comments on nonseekable_open() say there is no need to
check.  That would have been useful information to add in the commit
message...

> Also the patch is kind of sloppy...

The sloppiness was fixed in v2.  It's weird that there were no review
comments on lore for this patch.  Are people sending private reviews
now?

regards,
dan carpenter

