Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646A13B0AE6
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 13:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148932; cv=none; b=tcNBXWb6RkDy/WITxYe44S3GXfThIm/JY2nv5a5NNFXNUnwhTthbz44nVaLQN9BmEdpnJNQ0pc6gJSRCpQ0F+nbAUL/K56xIvvdcCz+rSGTEfv1NxX8WnoEaECdyuBInnxdAf26z/C3xbq24WhejtP7gPoWjNMS+71do+lFj43I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148932; c=relaxed/simple;
	bh=7C48eJwQxF2SZSyojjO4eehKdtPdDBqSboD/LkVXOwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SK0o1wICFHUcqgkJj0MXzfOKnqTi9oJalIXCdqEcBLe7v13HGyTP+NYcKaWzbhSt1U/UJNFPBlkmaxQVNKWvBmJL5M2yOhHAK9OC9ly+5+xTdgU8Qx7MTQoLfcoqegOyP2CaW2b+1zgRrXvjJ81Bcg/yySYapxb9IfQqD/epCgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zo0CYay3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zo0CYay3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773148928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5/adDEbR57gUpYJcJq84OoDVxrrM3xMPFmZCRo0jKXM=;
	b=Zo0CYay3fNS6nNUgO9JjxVGq9cPty8oV+Lr9ojdybQ8yTkOX4mN9U3Jy00cnf/ksl5lySC
	yySxefhsO579pYAHU3v/+4/Km7BtCaevJSSgvrsHg4X0Gz9yvYwnOWWC6jIDZFWyj++WtH
	+b+fK8uNDufV9iRkUqAPcaEBErJYWuI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586--nehqqsDNTWJ-eoBPsH58w-1; Tue, 10 Mar 2026 09:22:05 -0400
X-MC-Unique: -nehqqsDNTWJ-eoBPsH58w-1
X-Mimecast-MFC-AGG-ID: -nehqqsDNTWJ-eoBPsH58w_1773148925
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81506677so1375227385a.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 06:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148925; x=1773753725;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5/adDEbR57gUpYJcJq84OoDVxrrM3xMPFmZCRo0jKXM=;
        b=GdDmce9cRKLalbGVdSv9w+cukloIhLBwIZoIuRlOM2aH63sqBeEr9Kob4fiXVaBp/g
         TreKhz+VrJiynHsFsoO0PB/5jbHEilHymUNfCFkJrwYvLhOpI8h965kTShbUDV7paYky
         WQA1Uwp6V73iuVUwo03QlzMHZ7bazzJnT4+8Gir7IFYcSO1qtpzQnC8nlDuXeWwwiQr8
         I+lNgHo/bu8eeiQshLYIOiyMANLbvzK88psVPoldMCdV/j/ouVtreFfRHgrWlccARs8Y
         C7TQoYhcCE4s1I+G85I8iyEQHoTc+t9+/NfzcByWvjiWNYyv40lzRIhm8l+zyCX+cWXr
         TBog==
X-Forwarded-Encrypted: i=1; AJvYcCWctfuU6QMan8moh1k9W8o7T0ENUJ/F6EwyRqYwtouPaLON3IRC7h1e2q9e22Ws93QfggsNDZt4xCoeWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs5npHLIazDF/TzoR2aMaPX5XxLg3LQALp8TDJx6YQPeMKwtCd
	WckVqKfzo+S/QNgAWEspPaIqHCetR2GnXiGXWf6rzl0t0dx/4VBX9onjzVZPkWi9nefIx428vka
	mSOGso3duaVXH5zs5hddd1LWpbN/3UVHCfutrZK7ZRONuM3df8k3g9WLKNpeiNKut
X-Gm-Gg: ATEYQzzvA30x31Q/hU/8+MdvOagdB9N+A2yaHov2MuPiJuCYY8DXpU5DRdSflm1uhwD
	hLJA06/oUyUthM7QM3NNggIPex4IJimD+XOwPESgIoZTZGnM75NEecrCUjHnt85dX5eUvHWQaOB
	2Md5R/G24NWOM7ZgIuFgXlVhCuzvw9ZsQSRl7Z/4kFvsfPVTU16UhSx/4DzEnrjujcIeMxT5aBJ
	i4JkbufX4G+MI7zAhmiOQpGW7eJHE+I+/gKThAbxIVniurUEDDy29lzaUmmvhCTEkli6+OCdEcX
	zQzhOVpme0jh3bFBAGTHwiH+Mnm1HXD0Oy4SekRdvNt4myUN1SNTJLHJx1fOZGHcrlHrPhkOWQ4
	irsRxD3fwVWez8++IXe348SIOM3IZyOsFmJeSo76Y4iT6kFPYaTY++0H3
X-Received: by 2002:a05:620a:3713:b0:8ca:1240:4991 with SMTP id af79cd13be357-8cd6d4f9469mr1830786185a.45.1773148924710;
        Tue, 10 Mar 2026 06:22:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:8ca:1240:4991 with SMTP id af79cd13be357-8cd6d4f9469mr1830766185a.45.1773148922638;
        Tue, 10 Mar 2026 06:22:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd8576db0esm474754485a.47.2026.03.10.06.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:22:01 -0700 (PDT)
Date: Tue, 10 Mar 2026 09:21:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr,
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
	sched-ext@lists.linux.dev, target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 56/61] clk: Prefer IS_ERR_OR_NULL over manual NULL check
Message-ID: <abAa9vQg4BSxl1BJ@redhat.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: khg0m3yHCvArG2eySg4D4K73clDlwDEHdLwKXat1EAc_1773148925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2026 at 12:49:22PM +0100, Philipp Hahn wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Semantich change: Previously the code only printed the warning on error,

Semantic ...

> but not when the pointer was NULL. Now the warning is printed in both
> cases!
> 
> Change found with coccinelle.
> 
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Daniel Lezcano <daniel.lezcano@kernel.org>
> To: Thomas Gleixner <tglx@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

With the minor typo addressed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

