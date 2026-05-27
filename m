Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52DE42EEC5
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 16:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779899353; cv=none; b=th8BuTwYSj3soNUwvggN+9WB6kXepA04Pi08u4XI6dfLD1P6GMmgBZxQmtS5Qg0FpQJ7Rj4uge3FzsdLVXKkM8pqU4XlYXOosHqrdnLQXZbu+ss4BQ0yqa9zeODCz9K3Mbyy+7uVhDCuaDRjVXDiZArOPgLguwFC9iojd2QFfiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779899353; c=relaxed/simple;
	bh=MARgWSB2JRyHiWTRwBhBMqTryJPPS2jchIS4w1LrmWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBJyneCQgy5tmb1FSvvYrcPhDeAlZedIYJgky54yXFgCYtf2WYO3y9a7Mrk2NWgooM362hwj/AIZK/hVduBB/dqmxbsC/NsLY03lhfQDR1t7lgaenxQzO/aooyU5BfsET+QZhDwKv85XIZ5YgLQ8X2mo7vGyT9b0yyDRbvd1bZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g89DOoBA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g89DOoBA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso24857985e9.1
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 09:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779899344; x=1780504144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lp8EUEG6k+uQx75sbagyQs35jMaojHEjO5L3ntgLVNA=;
        b=g89DOoBAuI83xqPWszuqhCTddZx0ONETKVoZcKFdcASpTkVpc7A18DmvjXbkukKjp3
         jCzHh6oa0O2O60ft1uy4iEi3QrFypdTqA3bXE63RDDuojo2QkvpTLC4QvG0P5OSzsocv
         fEU4i5WODBfJsI4QSgvSCYAGpHQwvBou62wMJHBx4Ogc0QB+VeM8xYq14VPYB6aroWft
         GIJ3NGD/4re4dH4cAL6MU74xJCB/GqsPxFIqXwUz3hgODjcwYrWdL+rCF/7XwdcTaNc6
         qcAMLG3NeHvmXmJQ2AkRTxH83svDmpqoDBjLEPvCKlLfJwHNtyKbeO75s5nLFLuBMXVh
         MUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779899344; x=1780504144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lp8EUEG6k+uQx75sbagyQs35jMaojHEjO5L3ntgLVNA=;
        b=cZ9frQJSlddfsJbKOLBl/ucHCbR1I0w+LWWeuENBoSOJqiSp35okdMli9YsVNVwZW/
         o/8wlhoxjsPGsJt8r9ztsuPV8wojpiXI7a7GCgE5ZNDZsFdpYzkkaZgTGyQL/ev0vSM2
         mF+NPcvx/RPBDyveCevtq3qVe0ut95kFF3NiynkxnTsoXiSCdagQi4mIrbCjb58hoPhj
         bblKgouEoBPYAcu8PFtF3RNB6KQ5muhLZkL6YPcZQGvOEMLeZudQn07XzrgULcrkxsrd
         25JispiIRFiZNQXRWgE9MD1mW3RAnxHm/dJTK2eIL90rGa4/Ir856JxfVgPMMZsubveh
         Qq4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+sol2fIWnAaPrtEpMH+52gZH5DMA6FBqbaBhsdxtDu+q6Xu1eGE0BsfgqOb+TaqsCRRSMPcVzp7PgL6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+++VdQJAaMJoT+Pm5Q8TFnfdlc4MPCewkzNKuPwo6ve80jMdx
	RvKTSakG5VIK54ZK3K8oLkcFeRUEE+bCJTN9Dr0AEUxkCuiUGTOXySzmEMV28TEU0w==
X-Gm-Gg: Acq92OFGU+1L2b5vclbtLJTFjeq/sCMAmlhivgGJsHB8oLNEK6bCGZusi+LCW8ZxcPt
	4lgfzx1kbaVXNh6PrSur4JbvHHaplW7nY7IDAlP3wG3ZQ0JovBCAHngSV1chBS6vmCaIN+7tTMP
	8JgZqWv2gz7z2Z0TDjL5OyqhlYsHxAkJUsUZomq+NEAK3kgbX40srekFBcL+m+FCgVFfJRpPf45
	uEDYUSKnfDYvNo/xTpX+x1bi/3BZcJe8jJSZN5svKvKzZMYIQb5bqpgj17jYpe8eJ2mwQ2s2P2e
	JXruZejsjN34OI0ZPmKjNoO6Z+vnmp2IsOxZXgu8DlIVqlJvC74gqg5mI2iqD8EXpM+NReCy0nm
	sL+TBrPydbHIpSBOTgdC4yKa1TDutTeLCQKNLct8VuMmD6g1VFYRShHhnZDX/MBDH/byyB+lIlN
	iVfGy1yzluFIojz/xRcddti7mU1j12KTvMN3D7i9PVyiqNWURLXnVBaZ1ITumAaffsoKNuuBa7U
	AKCkA==
X-Received: by 2002:a05:600c:45ce:b0:490:5cd8:d213 with SMTP id 5b1f17b1804b1-4905cd8d33emr244688485e9.15.1779899343733;
        Wed, 27 May 2026 09:29:03 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561a160sm466125765e9.9.2026.05.27.09.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 09:29:03 -0700 (PDT)
Date: Wed, 27 May 2026 17:28:59 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	thomas.weissschuh@linutronix.de,
	Arthur Kiyanovski <akiyano@amazon.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev,
	Rodolfo Giometti <giometti@enneenne.com>,
	Oliver Upton <oupton@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Peter Hilber <peter.hilber@oss.qualcomm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	virtualization@lists.linux.dev, linux-wireless@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [patch 05/24] KVM: arm64: Use ktime_get_snapshot_id() to
 retrieve CLOCK_BOOTTIME
Message-ID: <ahcby8senHsmpOBm@google.com>
References: <20260526165826.392227559@kernel.org>
 <20260526171223.070087856@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526171223.070087856@kernel.org>

On Tue, May 26, 2026 at 07:13:53PM +0200, Thomas Gleixner wrote:
> ktime_get_snapshot() is replaced by ktime_get_snapshot_id() which allows to
> request a particular CLOCK ID to be captured along with the clocksource
> counter.
> 
> Convert the tracing mechanism over and use the new
> system_time_snapshot::sys field, which holds the system timestamp selected
> by the CLOCK ID argument.
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Vincent Donnefort <vdonnefort@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: kvmarm@lists.linux.dev

Acked-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/kvm/hyp_trace.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --- a/arch/arm64/kvm/hyp_trace.c
> +++ b/arch/arm64/kvm/hyp_trace.c
> @@ -51,8 +51,8 @@ static void __hyp_clock_work(struct work
>  
>  	hyp_clock = container_of(dwork, struct hyp_trace_clock, work);
>  
> -	ktime_get_snapshot(&snap);
> -	boot = ktime_to_ns(snap.boot);
> +	ktime_get_snapshot_id(&snap, CLOCK_BOOTTIME);
> +	boot = ktime_to_ns(snap.sys);
>  
>  	delta_boot = boot - hyp_clock->boot;
>  	delta_cycles = snap.cycles - hyp_clock->cycles;
> @@ -118,9 +118,9 @@ static void hyp_trace_clock_enable(struc
>  		hyp_clock->running = false;
>  	}
>  
> -	ktime_get_snapshot(&snap);
> +	ktime_get_snapshot_id(&snap, CLOCK_BOOTTIME);
>  
> -	hyp_clock->boot = ktime_to_ns(snap.boot);
> +	hyp_clock->boot = ktime_to_ns(snap.sys);
>  	hyp_clock->cycles = snap.cycles;
>  	hyp_clock->mult = 0;
>  
> 
