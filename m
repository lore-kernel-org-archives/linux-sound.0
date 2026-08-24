Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69D436AB77
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584515; cv=none; b=TBMH17u9wx2jkgNuDSQc9KXJ6/zj4C+F37220p2bE+DFs3uTfWa8YniL7mqSVZurZ7SdeARsaHMljU1Rf1TUIt/XRdHPhuYfpAvueh+17l2uo2BbLxwBOt+qMe1RMFzscYmva0JBnJZghT++eh8oWGZov9tCZnXV9WbiHKEm7MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584515; c=relaxed/simple;
	bh=8JhdYx7J0tlGsoGHXXE3+sEPiP/2ifTO/+3R6sQoj7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uVd/fWZp6I8nfwIX2UPGq72LUs28CGdh9nARXmI35D55FR753t6tJp9MzOYmZhvhhhiDb4zCf8j0kfVRABzYNI50aaI3QoIR5UHx+KanJxWzwAXH1bsihjlbVc0nFTnAwzee9mX4WYTW93q0qvoJGXgFvViuNoEpi3WgTkXyduw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JuxrtZyh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JuxrtZyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqeRDz9cJO18L1rBfXoSEkvn4bBP32YCMU3ziCPFmwM=;
	b=JuxrtZyhTBXZJzMlip9kcIdpwma415RIDzdZVW+y5QXQQRijurBxKn/cB66vQbTwHxH+tl
	e+uGPDnAfiD7Zx2GB6yQR6bgOM/BAVntDzeMPsVyQLAan3c/J8fIVtmrsvHTAJ51uh3lzM
	ttsY9v5I8IFfKqn5rgB04p+buYjbKuQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-avwy9K3BPiGQUc3LrCCLSw-1; Mon, 24 Aug 2026 11:15:11 -0400
X-MC-Unique: avwy9K3BPiGQUc3LrCCLSw-1
X-Mimecast-MFC-AGG-ID: avwy9K3BPiGQUc3LrCCLSw_1787584511
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ce64c41efso73452241cf.3
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 08:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584511; x=1788189311;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqeRDz9cJO18L1rBfXoSEkvn4bBP32YCMU3ziCPFmwM=;
        b=MOpbz3J0okVX1clk3ZPlCNu7ajno5h34lAYOC40zCSSUvNw+EYuCLm7rsqSYfRjs3n
         z8A38r6I2fUB2UsR+YVoXJh2Dgz2oX+EqWraSsDvEnvoG6m/fb4ERlv5POPi6YNHeXMb
         K5mYJW9gXZ5NE9YQ7l9/SkbpOEtL76Wq4bJwEDJdCGjo+YkUIuL0LhOp0QB8O5mq2AO9
         GkGMa0NspaeDAYVeOVxVY8TZcyNnOAf1UTmCkFhobDBRAVney+FDDUktZdSaZWRPNKoz
         Zvr1QBlmSt70lJack+PsyxCM/Y3fofo6TArefMGpTQt84wVEL3E1NEkGd6uDDlh/VJiV
         xGkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNwBXp0EUxSDRURMFxwu3wBhpwmCfrXZrnSJFFEVUmDAu24S1LzEU2WqMVPRrCP4r3k/KEpTENQ7EbEA==@vger.kernel.org
X-Gm-Message-State: AFuF++l927IrqFB6nxFsUUDyM2+qVdi6FFfTUAn7s4TaiVMqgQRt580w
	TdZeZ38z8VjN/yYcn1gQqaJniZAjoM50n2IV7ZQMkuky2uZcyGsatpiwQ44fdFkEpTImmn5CRBu
	23IuzGbb49d1baIXmLF2wL4W/XBkQb5wMD4qn7BN5JKLod7E555dVhkyy7btChHF3
X-Gm-Gg: AR+sD10r5704YVS8tiznxJAhIaP1EaipKkiazFveEPtYeZMJXDWhOF0WfhjB1NpFsy4
	N0BdZJY12sVVP7euPevDnGPzA1fknAKAIkLOWI+DtkwdPT0ZCrKulK9wdmImeLKNDa8rPIW92An
	OOL52DT2VRlY/MVCcO3sv2Ni7JgLhPkl9XDoNHiGh6+hmxuZe25hFS4IsxS8yDurzORCWt4vywL
	X71XXsMUmpFBb8ZHvi8GSan2XEfQBWg7NPOxOiHs2l66OyKoBLGQ9UMtGucsVk32FKbjuDA8BS8
	W7y7r+Za9Xn7vCQQnIWkTizDctFxLESMVo0GrgwDTKzPbkbeyi6OgjaS1w8wpqMWaehSfQN0u/I
	F4kh061MXz0GOJTAm0POQGfIPIldhquGc058=
X-Received: by 2002:ac8:5e52:0:b0:527:7521:3f8 with SMTP id d75a77b69052e-52e09d36c69mr182948321cf.44.1787584510694;
        Mon, 24 Aug 2026 08:15:10 -0700 (PDT)
X-Received: by 2002:ac8:5e52:0:b0:527:7521:3f8 with SMTP id d75a77b69052e-52e09d36c69mr182947661cf.44.1787584510247;
        Mon, 24 Aug 2026 08:15:10 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c9303df43sm64301876d6.0.2026.08.24.08.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:15:09 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:15:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: codecs: lpass: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxf_ONxLQatfhLu@redhat.com>
References: <cover.1787239902.git.geert+renesas@glider.be>
 <8f05a164722791336be39c83164a45b7a2d56d1f.1787239902.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <8f05a164722791336be39c83164a45b7a2d56d1f.1787239902.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FkR9UI0opEIQZc5vCw9Q7Eh-4x3nQn6F-SNnY4DHB4U_1787584511
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 10:52:55AM +0200, Geert Uytterhoeven wrote:
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

