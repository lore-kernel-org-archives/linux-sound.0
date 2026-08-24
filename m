Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB0F343D9D
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584534; cv=none; b=qz9GTtQutTWZm7ryrO1lehmgxZUHtPruPsoipkj0PSs6bTZg3aFkzNkwcFTAsJuu3SwnnoeuIDRyF8fqf+RGxlCeNvK8sdbE73VFUQyJnthp77SBXhPX11HVlGqlxYScWwXA32NfO30UE5q5Iz9mj2gZONY81G43mMtPxBpLSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584534; c=relaxed/simple;
	bh=rOXrxHiKVwq62hDB+l5Iaw/LvrpFfNRsCnnE/WH3O80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=AqW3s0j/IwzK/2PTD/LfaXW3FZZNjJ6oHd+kJHq1Tn+zo9V01s8EhjJSL3q4lbsy1usZDDdFOc/TSK7XlHqMUiZciRg3JwA0JimPN5a6zc68Prw4eNGVjIjRLUvLknyzLo94tQ+xrB/I/C1x+i0Pf59f1DCY6cLfsoyvPvFkfKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OHonTQKe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OHonTQKe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QomLv2Wl9amQb+LBn6L44LQaCfrla4njzarG+GnuCsI=;
	b=OHonTQKe2KAZony1/34W0BoerHadscdyBQdDvY3PeyAyditbL2wC0+jJ2A8tC/3PqNuhEo
	dZHE1Cu9v7W56f/nH34Mo3pItDvGZ+KsUsRrXwZ+OvPOn2CN4D1XjJwEmPLj93eh2Dhl/g
	61CK542WV99hw14Llyibbz+vZ97hu20=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-9M1LxRDmNaCJCUklnIONeQ-1; Mon, 24 Aug 2026 11:15:28 -0400
X-MC-Unique: 9M1LxRDmNaCJCUklnIONeQ-1
X-Mimecast-MFC-AGG-ID: 9M1LxRDmNaCJCUklnIONeQ_1787584528
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so359848085a.1
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 08:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584528; x=1788189328;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QomLv2Wl9amQb+LBn6L44LQaCfrla4njzarG+GnuCsI=;
        b=ApS90R7tAgLM3R9/+dgL29cfO74tPzorAnBU2/uUC1QgpLk+l2a8mLRJhVjmUB1r5j
         so9hJOey58yJYIDJKlLW2leAc0siGkuMbZYaagXSacGH7rByzSYUHxTmw/Qre5ELOtEI
         5KZIAWdwv6X+cPvQzCjir1IJhRO0Njms0EXGmpxHLYDu9ne3+toqRw8FW04zYj2xJ2UU
         1W3rFi/szz0BboMSKmjquL1DrxerXIkXyVEZzUxqQbaQk3P0YR9TErrRuqb5p+HRf5RG
         WMJaw5F9ieqU3VmoYR5XuNc/o8Su8pa298Rz2dSQj22DeKLV7HH6+V03xO8ACbd9Xhz+
         moGg==
X-Forwarded-Encrypted: i=1; AHgh+RpBusCFk3sQMgBwCFcrmKI1lmOS5Frjy0F9JQtNM5JFvvytwdkEbf1GJR6ze8G6uXapehYnWkgYm0ED4Q==@vger.kernel.org
X-Gm-Message-State: AFuF++kgnm3C1aP4WAnkKAg/SuTUMFOKLqXRp6AIQDLyS8c28hxwhvPq
	zeMf1srSjjbpVezxD81Q5uuAcY7MvmBeOiCfVPVvB/lDwh/v9UHo7Ooora4w0KMDv/GjvkKoJ3f
	nzMIM4jChHRhE8O7cIpK0x0BCe851nFosR0siWzX6VnbNCcbqwgld68iI/ZLRD1bO8X0oaqT6
X-Gm-Gg: AR+sD13U9/dbe46RWNeLdFtWkxOs/IlRCkcr8F5wJtjScDFvOB13Gl1SGReptpzkDvY
	kZGIxgHdEZ1cv5NpkBiXmfWiv7bgyGSI7m93GnkgYns7DkC4E6TD9gSIxZhJraS2UYyGEKX1g5p
	/TuhWsaSiSDs6ltkXdgRa3RJhSa+dYUFZEOM0rhQzmYnaip2lt3b9LmTVuWmITBx+Z3ByhqIT3P
	CZXI7VQ7nJQZR+Zx6allDueQM82Zf3gH3KSrUjXg3Zs+M2/IA/t32dm6brsnFbx+2F9C9lVKiDg
	TuO23x4Qea6Lf7kTuxk0ZB8pL5DYoBjsn3IaBkM94jiwR8uVuqDLtyyZ9NCFlZyyI6rbrG5M8Q6
	jZypKpQChbb3l+7E19QjHeUlCjXucQZT4kDQ=
X-Received: by 2002:a05:620a:4594:b0:936:9f49:69ca with SMTP id af79cd13be357-937398e83c9mr2267629085a.21.1787584527716;
        Mon, 24 Aug 2026 08:15:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4594:b0:936:9f49:69ca with SMTP id af79cd13be357-937398e83c9mr2267611385a.21.1787584526743;
        Mon, 24 Aug 2026 08:15:26 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749e9f956sm515969885a.36.2026.08.24.08.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:15:26 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:15:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: tlv320aic32x4: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxgDA7ZR6aoy9Fo@redhat.com>
References: <cover.1787239902.git.geert+renesas@glider.be>
 <7acfe448928df59a62418233d716b0c9806559d5.1787239902.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <7acfe448928df59a62418233d716b0c9806559d5.1787239902.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eMvryemJDWdQ_heccsaiZrwBm3x8TqI0Zjyn0haD8mE_1787584528
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 10:52:57AM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

