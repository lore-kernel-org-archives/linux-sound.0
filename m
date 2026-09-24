Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B8941D23D
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270257; cv=none; b=pYG1NDyTOunh8jq+SB3VnmA5PgCgXPkcH1aXOGw/LuY1J6UsD2BgwNuQI75GH0QhMhpEkj6AYeRNSUbA7DMic40Fd4u2a/nbDUgjAqG451DufW+c4W+e1ncuGDNYzS9kpgLc1OVa0Dr9gRDBWEBLSjVSWaIROfWCAK7sW7hWIp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270257; c=relaxed/simple;
	bh=N9G2xDWLJkhjpVHjPudlC9eB56JQvy0Q3UFpvQ70GnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThKF9PzCHYlkCoiZJCWCeqG059RMwt2HZiFpIljuOzV6TkRBbiy6BYzfggOhpaN93lCQdDb6HVhHTBiEFt+nmCCvyRWePY66mcn2kUZUzOcPqA09ikNoUVPgOQ5yGdEySJXrSa6Bp4lzz7NzFpjLQdRMcxM7hnJXqm6U4+Z9/eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Bkncun5e; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Bkncun5e"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76bcb1fso766101cf.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 10:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790270255; x=1790875055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=feTLx7y3sxZ57LB+c+M8YbdddVhljMzyHzPRAu6TpA4=;
        b=Bkncun5eo3wl/7Y/isVO3bqxSzKIHwv+JLNdR47oTH14bT62A0MCT8JkCQCcFZrvAn
         PSPLIyCnJ9BWquLDsfgF8+LfRG6BCav2aK8+G00i6xlpMa0+2PzNrMwAUzYcuDo3bSA6
         CyUOQ75R8JX3RZrLRIVcpwG56hxUarQoJ0boL0eCO3tPnpC4IETOjcIqbrQcKvWT1JTC
         KMGPIZ7u+N/xqcWFh83VuY/jJ8AzYfG2QrgbuHTh+Qp8vEMelJkVCl70mj1+hxzSAc6E
         ZMvT8A24gmcm4N5MH/QWtadFG9RrBd7NwCFywN0TuDSt9IaOIn/5tcDduKbUH/ovedjo
         QnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270255; x=1790875055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feTLx7y3sxZ57LB+c+M8YbdddVhljMzyHzPRAu6TpA4=;
        b=kAR++VYweL4XQuR08uMtuij4qUegtDJ3g8jrqtCuDCHiV9gGKyj2pFb+uFZXoykvOW
         BvK62aRNwDp9O6Pdlvn+A/3OkSdr/XrP2//NikhyhI/9DCwc+zOgCMiDutuWjqmm+/cn
         mYqUa+OeVCsmnjK1zDlPQjtupuBdoB3BjPABxKCV6NnHx6IwdaJP7UJig8pCdwjQ9iwY
         louxg1tMx8xt4rfUtWpIloYGEDCETJNENp4OTEzKavq42hWvt1CHMAEjLiCLcHHKgBzL
         mSoZa/b8joiupVnDt0pm8hVhvvp4O4GGseEYJUuofTTp4qNPZQ7NL8cBbRvN6CUP5L6Q
         +4eQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwas8BLem052YzymfQY4N0etGDRUFq6tRpdkXfk88z0bgXry7MT4rq0DE/ckfD5X2Zq3fL5JaLbMYlzA==@vger.kernel.org
X-Gm-Message-State: AFuF++khWRaI/zWuo2++c6ye2mArlJ1FHht84OZS6txgdiXcz7Q9ux0H
	amO0J8Tv0RSiGcMSJ3SiyScrqxHDzaR2zqq38Zs1ihKzjBDA9eS67GSvvWtvZzjRT8k=
X-Gm-Gg: AYBFou21bQOyY8hUopk2az//IHsyqXaJ2eHwB1GjeoSsv303StcnevserohMSc72O3+
	cjZdN1RZ/hHCgOaSyVuHp96WK9R4IKwmfl5KfxfGQsOkx50wNIPIaCZ/FnwVb7zuzyDpQuLSulq
	KsvA5y698QsszS9vr1SCh1jXfkWtKUVd90P/0Fdau6h8Snf19fe19nQgrZN0l4pgjmn1IxMNYOM
	fqILyYDNyWu3xBLXtVLpJ8tUp5YXDn2RutaDcfBhbBs7Ex2sABcsuEW/qa8LPz67vBo3TuXlX9Q
	+Aw66VP7mmGzuqB1zys6lNXORN88+961YlKUu0s8we6s2cZjVlwWzrm2QLTkhp56UYOjqSAevTj
	sDlPXBQ3K+SmXxgrkv1WbRNiaoZ22k0bVY+sL8QahivzO7vrZkEqgzPCQPBXJTPNsvqj2zCM7kh
	s3R7+MzNffWQrGm9KgBgG5VJsZI/UqA/n7SeoJBlgvsLBjeDb7BMZljeW7hj4OpCf00zZLCk6JY
	8YCDN5YBCzLRud1t8I7jOJSd+fjNIfueme5BqWSSeJwy2BGLcMAGfs=
X-Received: by 2002:a05:622a:2b05:b0:530:42e4:f001 with SMTP id d75a77b69052e-532feb3025amr31555731cf.46.1790270250746;
        Thu, 24 Sep 2026 10:17:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532f8b7174asm25743881cf.14.2026.09.24.10.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:17:30 -0700 (PDT)
Date: Thu, 24 Sep 2026 13:17:28 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, 
	bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 04/40] mm: consistently validate VMA state after
 mmap[_prepare] hooks
Message-ID: <arVW5i8pvySq6Co2@gourry-fedora-PF4VCD3F>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-4-4583d8a23bca@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-4-4583d8a23bca@kernel.org>

On Thu, Sep 17, 2026 at 05:22:13PM +0100, Lorenzo Stoakes (ARM) wrote:
>  static inline int mmap_file(struct file *file, struct vm_area_struct *vma)
>  {
...
> +	err = mmap_hook_validate(prev_start, prev_end, &prev_flags, vma);
> +	if (unlikely(err)) {
> +		vma->vm_start = prev_start;
> +		vma->vm_end = prev_end;
> +		vma_close(vma);
>  	}
> +
> +	return err;
>  }
>  

I indepdeantly validated the sashiko report on this chunk.  Seems like
close() should be deferred until after __map_new_file_vma() calls
unmap_region().

suggested fix is to drop vma_close() from mmap_file()  and update the
cleanup in __mmap_new_file_vma() 

if (error) {
	UNMAP_STATE(unmap, vmi, vma, vma->vm_start, vma->vm_end,
		    map->prev, map->next);
	vma_iter_set(vmi, vma->vm_end);
	unmap_region(&unmap);

	/* Release driver state only after its mappings are gone. */
	vma_close(vma);

	if (map_same_file(map))
		fput(map->vm_file);
	vma->vm_file = NULL;

	return error;
}

Example race:

  Thread A                              Thread B

  mmap(MAP_FIXED, address A)
    driver remap_pfn_range(A, page P)
                                         load/store at known address A
                                         hardware finds the new present PTE
    validation fails
    ->close() frees page P
                                         UAF
    unmap_region()
    TLB shootdown

With that fix

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

~Gregory

