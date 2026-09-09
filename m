Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08BA5678E4
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965700; cv=none; b=D24igm5XcEsozEODDvRnYg0nI85+0mR5wfLZnEfWcQ9bpQ6eLGmPlwyEXjCHKkBtgszyMjaMlJdaXzeooAPOFjerJKljHnvSnBsG+7Y1BPpuTmsRdANHLAPOsvGg2BMha9Jer0LAx7CNJxTPtVTeFx9mquqUTmZ97NpxRxDZ3T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965700; c=relaxed/simple;
	bh=3mrzF4PFQcJ4DbH3RGaSc+zm2PljjP5W+lnaM84CL3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKe+zobqGTyZjN3SnqQTZoP1NMrFVHgL+lrweqstCoZMXEF3v8fBRWrYsZgUx0k1HXXeNJV7pICGGLvQlNvHmMG8LSPgpc4rYBE0FPTmutrXsCQG/zRUKVGV+oDvHs/ZLKnaGJY8QUCQftm0lxDKsND6uK6Xtof96dGAr/Waah0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IffCLY9U; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IffCLY9U"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso160226f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 07:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965696; x=1789570496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CEnAlwwtVf98S0MQnKDx/a7P5qnwKuSWE+q0EOlFqn8=;
        b=IffCLY9U20m06r8jq41Wip3wbMxiCRO5u98+gwJ4IShm4wkkg7X/pL8ySww6J4XebT
         8G83o+T8HV7UQxDY3AILmU5PPSPuO0534vpsVpgml81WxUkg+jSWdlsrkZC1XojQfCR9
         wPEjfOUTpu0aWTpyHsP2JLI4iJJRVFv2sABsgKZDRr9k7CZCff9jMvjKbbYGvq36IDFe
         m7IyRHupa9IRPB9ER/5GcA3V13z7+3yeRCUbOWz3N6E2aXBB+QFxpxYsIAmSR8V60/bn
         NLxgbMrD38xmDezTXGpi3zHNw6RU9YnQGWCE6LS1nhtK5eZf2geTo1QVmBir/zZ28I2y
         AQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965696; x=1789570496;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEnAlwwtVf98S0MQnKDx/a7P5qnwKuSWE+q0EOlFqn8=;
        b=EeHIA/2wjKdxJtjXTTWXQ38tWpLhmflOvJxDsBCa1cqS9vSHFLrhXU9IyTWNgr1/UZ
         uqD3L5bDF9ez8hE5smJFkFI/inh9dHqHYH87d/SSE2XS09iD5HQGv9PsoZMujMUe76nj
         /LJuJVsVi7Z0r3jlRZhB6j0K4RVam4fwKfqHe85QQLF8BZ1DEuggyT409oKL/nU4K2iT
         HJEPmsLG63h33qtYTJjFduNh0IhXCje1xReESXC6tRiwh1/Jpg21wrP2M2CGSqkH23YB
         ijvKavpcUYfGn2DvAvhpclr2HKnD4QwlF3O2EdymOsY9835OtKwFJ2JG0AjQWeK9kRqR
         9fnw==
X-Forwarded-Encrypted: i=1; AKwUvBzxF65ixkTKZFeCZySV6x+1s9KG/RxvPbRNO+eKtjOEW1vwErV30VmyFgCvh4J2RK41dOiypmX04ZOZfA==@vger.kernel.org
X-Gm-Message-State: AFuF++kzMqg1M2nzqlAEGy7fcdeyFs6X+mXA+d40DCR8qij2LBe0x2Xf
	H1SKh5LutuKjG/bOEWpOLIgN0FruzmoCyUD1WW7IezxJpBu1JCxnDQBU
X-Gm-Gg: AYBFou36n0fG+gReCV90AeljNikxoZWKL5KAHyPG0VYxo8CWu2DPdp0sh2Yb8bsP1Yk
	5zKwK1pG9IJtgT/tYXWZeAKiB9XpKtQd7r6keLxHiUKNhyNokcFOvBj2bplr127M4sKNHOceKZR
	2MSN4ebaaOb1TnRcXHC/Jn3hIBBs/WmGc3a4tmHlUcv9MUSI15yZtPlvdtbMC+kqPS6CI7Z4d7s
	yFXv2dthsNvIgJ7cy2ri0Nc6ob5wE7PcDexj8EL9KZsXbwKk4LgvFQ4SlHV6Armw+qoXI+RPtQJ
	ZRAtmuWCh4PztwKyFrVxnxWkeO8TWvxacBCFPWO7R4A4AXu5g14RkRetTznxlM0iNpGRGlg87NW
	IHmoYvhcK5qgSIMT2cE4M8pG20E+qZ0BSdpdYue6W4UCks9QWpm8mLGXgRD/Gdzp/Gyqw7QXtey
	zMR9nmnnrtC28eWP2QvXxBGRl6Qahzuo822oSyWNAvWs477Qh9BbqT2uy8ZW5gx3X5gw/xhTr90
	yFlr5w=
X-Received: by 2002:a05:600c:a01:b0:49d:1916:2133 with SMTP id 5b1f17b1804b1-49d1916215amr117005945e9.8.1788965695566;
        Wed, 09 Sep 2026 07:54:55 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm384918195e9.13.2026.09.09.07.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:54:54 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:54:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Breno Rodrigues Alves <breno3011alves@gmail.com>,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, arnd@arndb.de,
	linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v5] Kconfig: fix typos in core makefiles and purge
 defective DVB debug (v5)
Message-ID: <aqFzOFa3ADXIBo3G@stanley.mountain>
References: <20260905003005.118245-1-breno3011alves@gmail.com>
 <22707a1f-970b-4309-905d-13ac794c51fa@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22707a1f-970b-4309-905d-13ac794c51fa@suse.de>

On Mon, Sep 07, 2026 at 08:59:28AM +0200, Thomas Zimmermann wrote:
> Please stop spamming this list with revisions.
> 

Generally, the rule is wait a day between resends.  Otherwise it
becomes pair programming and no one wants that.

regards,
dan carpenter

