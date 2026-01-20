Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE3535E529
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 19:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938997; cv=none; b=YneF006n6QPQFmAZjEazWKlFrsaYNDFWtnHsUEcxLxPNKik4A3EaZw1Rp0wWQolaWuEesjJ5DNndqSMHsMl1l5lWduSxdxwa0DcfobLvQ/5r2tSUlsu7ROuYJuj/4wRwRaruAZSqKwJXLC0KDG5RS+cMaVPd/KmdgjlHqFrSfDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938997; c=relaxed/simple;
	bh=dpRYr3skIgV0rzJn+6D/Wwyl8T3WJJeqflIDq7vz970=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mq4/EU35qbKOMtLRIiIY8X/p7sW1XYCSsM/wt4WCpnbx0cUMnMhTsVpQgY+JjZQNzHT6tXQLWj1ggcI2SVZqTTKVtCQgIV63G9ImBBGF0UsH1suN74TxpeRObR5dS/DMuutJ10N/XTRVs+Yfk3u7wCw1hIgZwCvKmxkPiZd1eCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilTP+W8u; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilTP+W8u"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12336c0a8b6so12128324c88.1
        for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 11:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768938993; x=1769543793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lPDgUMFRl+w+AbB4KcmndfGR0As68bgylKNbbH3AGMk=;
        b=ilTP+W8u0C7h7XBeoah7AsJ9JL095ZDFwxa6je9YceSe5kL434AEa3e23rZIbJCd2e
         jnO4xLKmsw5RyE29tSBo1CYXW/XhUGjPEV8BMF3noJo9ZL8fHVkWA5vnGSaSQLiOet2G
         u33Z96XEok44vp/L8jcalhxIbLF2VdgdGVnEmHJyBf+WvA6eY40iDArMrDCHTCvuYbGV
         R2IRMW4ie8d0lDUcYo3zWHSLjXKq85+4R/INtdkQm9SrWFC2O2lwXCSL+pV6WY7K/Y4J
         v/prpxeGXBy2mhWGLzQMm/WfVUt37+/etLvLAhGEDEyKKhHhl6i31LdTJJSmRTJrCn8K
         b7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768938993; x=1769543793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPDgUMFRl+w+AbB4KcmndfGR0As68bgylKNbbH3AGMk=;
        b=Gunp6KFOQIQoGFUIHVzgJF4MfblzNkJxJz6VQ9QJhMt93Js9jGhQbP+GxoY5ZOqLCT
         tRc+S26YW0FXIjGNLYhuY0jPOUqyenJ0J1dLaA1I7MuTKMVI62Twnx9nZ3iFypviyZAM
         v/BHhO2q/ZDDdnRLcBZIvPP5W+1s3ezVzKI6XMhSpDtIMe5JhabbnmqLpxoxqobkG3V0
         8Edx7jgsGGHZilR3kW2eis9OllzzLyZjaRGDykGVtZluFSAPBaQpx5YKVZC2cwxrRW5R
         AvRHfiNRr+CFxjcAv+d0Qd7w3x7QNad1/0DFER3hch/O/4jCjo+AFJiat+0pNuzJtVd+
         EW2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkla/Y4CcQrRpg0mrcMoPvzQEW6GBMnqO7ZVAV1iUfYr4zZA1RpYa4u7bq/0lPvTkhE27TPpSMQNJQ0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPCAfAxOQT/opKGIMUv3X4wCqm4ikivhvxPoXDWSnF6sAcs/+K
	TtziVkwokpF3blxPGUJmfnDKCDsEHqNxk8h5fFxLeBA8iZQEGXcArK42
X-Gm-Gg: AY/fxX6q0GZLUC6JdJAcwgqK8bd8HvearFDyDDiXf07xL0brlWDBgNzyzhhTeWvlt5W
	t21SL9VSEM+bz55RGm4JG/kwYrmdUKeEhZHyhDqKE8OKnhrJlNeI7qzdOaCddzeszETJK/hNbvu
	57XcD+zAQfo+raf0iu6qYeE1hJ/stXQbpBtPOWdOn4Gv0MpJTz067OpTjuG8AoMc2q6Ugq0MvbR
	MAeNlR51HAF0d4By6UA5oNe0xLVi/Plbers5ArxK/qdLrgVe27dXiZEOjyQ6sqs7xRT7nPiadcq
	Cx3X5Mk3U78Cvu2fCE/wiYW09IiRSFVyn6ikpJs1YKrXeKShdkiKvbYB/WeGfBk5BTLd1Bz/vcW
	hWAHh0q8ss1OG9Lhb+suPkMUm3HIhGGwU/h7D92kRvfPzg87BL+K3LAfhmZ/a3SEwV5iSuI90/6
	6zb0NWbKHwBh0d1Kx+gA8oMoR3zETAnfTtSy0bxp9UXg4/x1U56IOp
X-Received: by 2002:a05:7022:608b:b0:11e:3e9:3e8a with SMTP id a92af1059eb24-1244a7910d8mr14869120c88.49.1768938993269;
        Tue, 20 Jan 2026 11:56:33 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d631:e554:f0bd:4106])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad740c5sm23388705c88.8.2026.01.20.11.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:56:32 -0800 (PST)
Date: Tue, 20 Jan 2026 11:56:29 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, sre@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 3/6] dt-bindings: input:
 google,goldfish-events-keypad: Convert to DT schema
Message-ID: <nab4yksjgk7jbofm5fkrafuz5c3dmi2oocdzgoscfj6ua7zwfh@olnrxt7sa3qp>
References: <20260113092602.3197681-1-visitorckw@gmail.com>
 <20260113092602.3197681-4-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113092602.3197681-4-visitorckw@gmail.com>

On Tue, Jan 13, 2026 at 09:25:59AM +0000, Kuan-Wei Chiu wrote:
> Convert the Android Goldfish Events Keypad binding to DT schema format.
> Move the file to the input directory to match the subsystem.
> Update the example node name to 'keypad' to comply with generic node
> naming standards.
> 
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Applied, thank you.

-- 
Dmitry
