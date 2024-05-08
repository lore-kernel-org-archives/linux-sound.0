Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8BC126F08
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 15:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715181275; cv=none; b=lm7YVu6hxGuzushCDy6eghjIHOBKB+9QyokOMQMum4dwURnkYuPeaQRcNfGyvaJNqLn2uuUgOnMuaJiQMzIdmf6Bp5Yu7wSgcCOmoKp+oShC7hgKzAsF0pKcFqBy4nivoVcd0+6WmPdxMcnL2zBSSXFvG5cPv3LMd01a6ZBOADg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715181275; c=relaxed/simple;
	bh=oc3YjhekbBu0GJ8Srd9l/xh5UwuAWWfmCFi9+LHB1v8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kBb6WSNusEDzN3unnbXPi9p2dv/ztOzV12EGfgy+7KzZLD8fOoAQg0LmtHMxca/hA3e4QvSO+vJV8eO8/7S+4tDWVXIS5P1TfgEs8l2YN/iSDh7AC1niLwrPWQMMcovY41ARVbOg80UgaxSc2sdL1WMsdz79o1Nt4WMs/UIEicA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WUz0qPAo; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WUz0qPAo"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59c5c9c6aeso965865866b.2
        for <linux-sound@vger.kernel.org>; Wed, 08 May 2024 08:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715181272; x=1715786072; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6sxdRSTAf/OpibLGFqPrRoos9aGkQ/nzdwORtk6ZMGI=;
        b=WUz0qPAozWhPrOUPb/TUwqJyR8YM0uuMAZQGzsvYcTjNi7irtX2JHSU5mknSRDMkjj
         D/DwZvfvMIfSOcvT6kxGTKFuP1CXUbLzusH7qrVPY0hdMI2hvBPf9dd+kDRGo9wZVik7
         eTGZgT7LKU4iJV3N1A9ls3Eb07epsYh/okSue+AO22BhAtHogQZNZaasCIOizcSzrgLN
         utnM12g/XQxOV3fRqdGIzwtNIakBkludjyWjQp5OLNzOQ3KdkopLx9uE/mmh3Uk+/Hgt
         GZMhYhkoStk4AkIwDk3G3klBdhnlPD7a/OU33OHnVuohoWghXTcUrRm9lX9QQ98JYrCu
         I2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715181272; x=1715786072;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6sxdRSTAf/OpibLGFqPrRoos9aGkQ/nzdwORtk6ZMGI=;
        b=SfY2c7cM7HDQ6O4Nr45hA4eFZ819hH/SkXpT7GR8BS4CirL50zAIpbepEIP3nawUBm
         qHSO1tPxvXIYIc5oX7jZmv7NS7LBO6f7hEPexhHADQLewdt+HDmV1KDo8FL4V9R5P8ki
         e93HAVToIGcLWku+ZzkyssOC02P1bu0Tvd7GErnZcxhRFsyB35xQAwfHxm38WznH/83q
         UGghyJk5eI8uGNylFkJ0Wc3U45vJAFd8qeD+emzx8pCMJjUi/EfZSnMaIaFGEuktNhjN
         Cb9vpRry1xjvxFJSFMLjQzKAmdkr2GYEgLREPaHCo2G7yuUWVKYgp5Bm6eUsEyynEMvm
         KLsg==
X-Gm-Message-State: AOJu0Yx4XY8VAcv9jPfyJ1aL+1cN3GVDfYDl2KjSkeB8D6kBEfNp6ejO
	4OEQBhC8JLC1dKdrkRyYqICdqYUvPWY/g3ig2oWTVpG206CjDUF7uZmwce9hnqA=
X-Google-Smtp-Source: AGHT+IFyiOMRm529nWN7bBjLWiyPUainIu7OMmx6YF/ZaiC3pW+kgMQjwa0ETO+h678gRFIqxznVJw==
X-Received: by 2002:a50:9e8d:0:b0:56e:24a5:587a with SMTP id 4fb4d7f45d1cf-5731d9d2913mr2268862a12.11.1715181271604;
        Wed, 08 May 2024 08:14:31 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id q11-20020a056402248b00b005726b83071esm7773329eda.4.2024.05.08.08.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 08:14:31 -0700 (PDT)
Date: Wed, 8 May 2024 18:14:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ASoC: audio-graph-card2: add Codec2Codec support
Message-ID: <f930862e-9d30-4ea3-b3e7-b4b4f411f6d1@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Kuninori Morimoto,

Commit c3a15c92a67b ("ASoC: audio-graph-card2: add Codec2Codec
support") from Oct 12, 2021 (linux-next), leads to the following
Smatch static checker warning:

	sound/soc/generic/audio-graph-card2.c:1206 graph_count_c2c()
	warn: already decremented on line 1206 'lnk->kobj.kref.refcount.refs.counter'

sound/soc/generic/audio-graph-card2.c
    1194 static int graph_count_c2c(struct simple_util_priv *priv,
    1195                            struct device_node *lnk,
    1196                            struct link_info *li)
    1197 {
    1198         struct device_node *ports = of_get_parent(lnk);
    1199         struct device_node *port0 = lnk;
    1200         struct device_node *port1 = of_get_next_child(ports, lnk);
                                                                      ^^^

This calls of_node_put() on lnk.

    1201         struct device_node *ep0 = port_to_endpoint(port0);
    1202         struct device_node *ep1 = port_to_endpoint(port1);
    1203         struct device_node *codec0 = of_graph_get_remote_port(ep0);
    1204         struct device_node *codec1 = of_graph_get_remote_port(ep1);
    1205 
--> 1206         of_node_get(lnk);

So this of_node_get() undoes the put.  But if the reference count
dropped to zero then this would be a use afer free.

    1207 
    1208         /*
    1209          * codec2codec {
    1210          *        ports {
    1211          * =>        lnk:        port@0 { endpoint { ... }; };
    1212          *                port@1 { endpoint { ... }; };
    1213          *        };
    1214          * };
    1215          */
    1216         /*
    1217          * DON'T REMOVE platforms
    1218          * see
    1219          *        simple-card.c :: simple_count_noml()
    1220          */
    1221         li->num[li->link].cpus                =
    1222         li->num[li->link].platforms        = graph_counter(codec0);
    1223 
    1224         li->num[li->link].codecs        = graph_counter(codec1);
    1225 
    1226         of_node_put(ports);
    1227         of_node_put(port1);
    1228         of_node_put(ep0);
    1229         of_node_put(ep1);
    1230         of_node_put(codec0);
    1231         of_node_put(codec1);
    1232 
    1233         return 0;
    1234 }

regards,
dan carpenter
