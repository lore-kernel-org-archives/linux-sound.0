Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B1F3C4571
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774350787; cv=none; b=Rt+MEuODLTFzkIbwl0R+NNW86lneY4H632bA3657lBw5Kad9nexWA6OEIJyXDEL7gTLJ8cMGO3T55QaVL0afwNI0TY8lwH7hyYXUf4Ce8NTHrEI2QJiF6TrrA1bw6NWub7Cz56l4qy2RZ+q0aJ9IYP4ftYpJxiHeuUDuhOexK2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774350787; c=relaxed/simple;
	bh=XLBjDdo6A6F1D0HM9nREF1ojvBHwPFAqF4vFIUFByq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wye4hd7Ge9nJS9HISUwjzCOPhQDvuA9O7/eZ4o99klfPhYA0bLt13PUV02Dnm76KvLUyonPVQyl3bcAbcI8I++7ITinx6VT2C602fArUFCScCFu2RzEGnc2KScr1wiwyNaCCtSCEwF3hb0EkM1P0AgJEDANtmVWx/Cp74gHAwdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foLXXnWL; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foLXXnWL"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so1865601eec.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 04:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774350785; x=1774955585; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rlr0EBhETDVXxYhev/vowRNn4txadi487PR9lj+/9AQ=;
        b=foLXXnWLanxwmV8eyxVg5cVgrBjbCkkq9t1W3sofv7pFJGNeiq+2AtyyRoHjyeARSQ
         LX2ibU8n8UnBXKhO+278TD7TgHzAFNoeMQHbziLDVj1BPpiKG/NaCi0hAUlw5l5xX60q
         Ak7VdkWtUmtQzteRrR/wUaDQakYr3mgbRmqeiet3IRrnVIbPU5G0aezN/KZNRpC1SRmT
         PmvJD0bVbqMHsYKMuHl41NPiB/WpOWCmH+74G7z4+9SVTDzkieZ5HLA2MUajL4/aNkna
         N32NytITFh5sy/yUIyjFpCSNAvVJhMPgwJjPpkAxNBhwtwJTpd7YxzKMlg8LNZbKYFdd
         MM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774350785; x=1774955585;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rlr0EBhETDVXxYhev/vowRNn4txadi487PR9lj+/9AQ=;
        b=cBneKYDvFmm3gNC8x3TiJTtuRKkfQc/lrLWllO9LztRVMOm8EE1vb5VYHSD9BsVGA1
         UG3ilrnggV0U9vyCGGAlq7pCvD0OeUVjbcxdI3aKP8p6Hlj+uuUqFfs6iSdKcDTyGYLQ
         7xhgIYSci0BGB0eeIp5A+vf9KcUeFtVpxI7kHuwsyOiNMyESvnU7N5VneC0pHE07MzdB
         V9sDGbjgIvN/YofJQBlv40F4cR0+f4chh1S8/HxWCTA1+fq0DJryuY9o31ez4EvgxlpT
         CVHJsdSorC9UQAeQOFdp2FkCRtFyPvWVA+14Q0QjqoQ/GRfmjIfANWZWAjCJzBtlfk8A
         UrXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9kEoejUIK8fxtJMv9vVX2kJija3cIV93Ku4w2qDzTanTeePfcS58LJ9bpcU0DeGaOMGI4zYW46PviEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgJsq2a/nBIW3njzVS7SRJFfe2KD1qC/Y/UykyXb6F65mok1BY
	7k8I6wIyByg8CmwCiwxnKUoHaHGxEROcQ4PkYBitGZlxDsz0N/LUNdZo
X-Gm-Gg: ATEYQzypn2abtXFksdyE+sots4uF174UCVyRxTc37HXzEXE89oKhcA6mZ1HD5GziaUN
	nndCtatqD/MrNrGsQpJA8ZNtVgj3qMT58v1RuXvT6VDbpUzE26lFC9xnyvypxE1od5ZMDZAjYEs
	yvydSG/tncLhsttvtu67RadXFLf7aeZuIl0hqViZxOyMEBjxHpmdAMSPwZ1kGTKAccuDUvZyQmW
	JTXxnwk4qjjdCiCPTsHtq1Sx7jjc8+TZE/Rp+AqHeS+w+rlYwzlbTzE1JyTXUMOZbl6ArbmILdX
	6Um/308lAi/iX5g4AhKWe1GF6mXbB05jaQD0GSbljJx90xEP3FbwkkVC2zDajdvGCrMesS2JXTd
	SA8hgvwz20D1ILQSNwIYPKN5vzIitF0laDKeYQfMjZWzzzQt6GUOh+zVz8yuJ6yY8LdVZ6SGvWj
	GLBFrjx8/gcp4yjaMe/X6HAN1NfflOQt0OSNWbMwnTnl78GepbUtQjZFj/3Ft+nvxMVgc0lg==
X-Received: by 2002:a05:7300:3c05:b0:2be:140c:bc4a with SMTP id 5a478bee46e88-2c1095d7855mr8442227eec.3.1774350784989;
        Tue, 24 Mar 2026 04:13:04 -0700 (PDT)
Received: from localhost (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm1187186eec.2.2026.03.24.04.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:13:04 -0700 (PDT)
Date: Tue, 24 Mar 2026 08:13:01 -0300
From: =?utf-8?Q?C=C3=A1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SDCA: Write init table on function status IRQ
Message-ID: <acJnzC0qrMXcMGEW@ortodist>
References: <20260324-sdca-function-status-init-irq-v1-1-bba49417a4e0@gmail.com>
 <acJXZudDv8JjWrMK@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acJXZudDv8JjWrMK@opensource.cirrus.com>

On Tue, Mar 24, 2026 at 09:20:38AM +0000, Charles Keepax wrote:
> On Tue, Mar 24, 2026 at 12:03:59AM -0300, Cássio Gabriel wrote:
> > The function status IRQ handler currently acknowledges
> > SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION but does
> > not perform the function initialization writes. Since the
> > handler clears the function status register afterwards,
> > the request is lost.
> > 
> > Use sdca_regmap_write_init() when the initialization status
> > bit is reported and apply the writes through the device regmap
> > stored in the IRQ data, matching the existing class-function
> > boot and resume paths.
> 
> Generally speaking the init writes should have happened as part
> of the device boot. What are the circumstances where you are
> encountering this?
> 
> Thanks,
> Charles

Hi Charles,

This was found by inspection rather than from a concrete hardware
reproducer.

What drew my attention was that the current class-function boot and
resume paths already handle FUNCTION_NEEDS_INITIALIZATION by replaying
the init table, while the function-status IRQ handler would just
acknowledge and clear the same bit. My concern was that, if the bit can
legitimately appear in the normal IRQ path, it would be dropped without
taking the same initialization action.

I do not currently have hardware evidence showing that this case is
actually reachable, so I will drop the patch for now.

Thanks,
Cássio
