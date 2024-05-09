Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866C82CA9
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 06:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715237375; cv=none; b=mglr8pkOS3eEnQv6kgVqcaaU0hTRIT4W1t0KT0AAQSQcIiw1CNqZrME71tNjH0H/G8rAvr3pY1UL4emeouuOX7zoQwAHHhfkecUQk5GcILjPZSepPICvMgs6jgDUfyOD2MKHVeJw8FYobD3RW0RqAyFHjRxXhumUbh7HnwJVz3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715237375; c=relaxed/simple;
	bh=2WIXqxROMD1i6HuRnSZOBBxkvEoo48qKJWNTnW1+yoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnwyzXXze4IlKqB3Ul+QOdVGfVCkQkrE93qze0zHoIXSkCQo+ESe7pgvIAG3hPD0I0nQJJoMNmx7JAPpXD6Opkp+q/6jz7cB+zNwcsh23fOS3IipmCPnnsShjUFsQY32elBQJCUHve0hDmyZYuHqDpr+xdQFOTOtxkOGOkPg/Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p38HccNy; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p38HccNy"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59a934ad50so114120666b.1
        for <linux-sound@vger.kernel.org>; Wed, 08 May 2024 23:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715237372; x=1715842172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BJpdZmZ+ySeGSH0CahNCodLUJ4ekgJ6/7BYEBiPJZsQ=;
        b=p38HccNywagFjGCB6eLh8PpAZh+Rd+8n5sJGWG3e6qyN9fRcdJiMsdaWqbA9DEMco8
         mO+QfNU2hqSJf8CBoxnAA/bK7YWSNdfGqheMWmi3TebRc3xnI2shy5hPU92dTd2m9MLN
         EtSSNCb9eFuIWeQQ4rAH2Fj9SIa8eVu3pmCxYbF9BNP1TlQ5vX/2qHxdnOwep8Alz/Xe
         VxSkyTTjZeFCw6f+7iSNDKteDqmx2f592cqSRRx16gQwcTkusl477dqUrNm4Rl3GwEiR
         YVFDJZSUuD1YxSrfSFhQwC8l4gqNlRNBFmjkUTIAMqyl3XQ7ZTnrvJJk2Qd2wFX8xvEQ
         aINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715237372; x=1715842172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJpdZmZ+ySeGSH0CahNCodLUJ4ekgJ6/7BYEBiPJZsQ=;
        b=nOyr3Z6ImqM0YavMRfSmqbYMAvGan8lUv4mlP+d01vpLRdpeEHplmOd9CcSkCjT9Rt
         aYifiJIer+d9urGDVf2SSmh0X/gyIMzEIAldurmktXLrtD7UqN8quAtUydGaD09wORQB
         NraYexvwGj4dqpqwBU48vzlskLb2OuhY///ZV91ZIB7RiOK8ockF7ixjbcyBiX9jbVFo
         6Lg0TG78rdI+eCG83M1PyRfR0gX6IzRh86atNrz9vMTQ231F05UGoXjlcg9C+VNLDOg3
         ndpWKOY58CDJ+pWctE/6ZyudDQfOpvtV+eknrkz8t7ajXLIfgGC+pCsJtAujNnPDyvJn
         T5eg==
X-Gm-Message-State: AOJu0YzUv5kCvleYmYFDLneURX3GfGQoKBo7AEWsmkOxtppw04eqWn4F
	IeqeH10WFn50exca9RCQydGiJDkRWKEQChFYOnd59MFboX1Y4wLekUy+r0xkKOI=
X-Google-Smtp-Source: AGHT+IHDy1rfXFBEfjAvk3OuD8SJm7UiExA4aCWbisSV3z/dusXf8HnNSTdF2MgX5lswhwNwSQSJVw==
X-Received: by 2002:a17:906:f298:b0:a52:2486:299f with SMTP id a640c23a62f3a-a59fb9e9959mr298261066b.71.1715237371786;
        Wed, 08 May 2024 23:49:31 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179263d9sm40490766b.95.2024.05.08.23.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 23:49:31 -0700 (PDT)
Date: Thu, 9 May 2024 09:49:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [bug report] ASoC: audio-graph-card2: add Codec2Codec support
Message-ID: <241354da-20c4-4ef0-90f7-68d6c4ee13d4@moroto.mountain>
References: <f930862e-9d30-4ea3-b3e7-b4b4f411f6d1@moroto.mountain>
 <87le4jall6.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87le4jall6.wl-kuninori.morimoto.gx@renesas.com>

On Thu, May 09, 2024 at 12:13:41AM +0000, Kuninori Morimoto wrote:
> 
> Hi Dan
> 
> > Hello Kuninori Morimoto,
> > 
> > Commit c3a15c92a67b ("ASoC: audio-graph-card2: add Codec2Codec
> > support") from Oct 12, 2021 (linux-next), leads to the following
> > Smatch static checker warning:
> > 
> > 	sound/soc/generic/audio-graph-card2.c:1206 graph_count_c2c()
> > 	warn: already decremented on line 1206 'lnk->kobj.kref.refcount.refs.counter'
> > 
> > sound/soc/generic/audio-graph-card2.c
> >     1194 static int graph_count_c2c(struct simple_util_priv *priv,
> >     1195                            struct device_node *lnk,
> >     1196                            struct link_info *li)
> >     1197 {
> >     1198         struct device_node *ports = of_get_parent(lnk);
> >     1199         struct device_node *port0 = lnk;
> >     1200         struct device_node *port1 = of_get_next_child(ports, lnk);
> >                                                                       ^^^
> > 
> > This calls of_node_put() on lnk.
> > 
> >     1201         struct device_node *ep0 = port_to_endpoint(port0);
> >     1202         struct device_node *ep1 = port_to_endpoint(port1);
> >     1203         struct device_node *codec0 = of_graph_get_remote_port(ep0);
> >     1204         struct device_node *codec1 = of_graph_get_remote_port(ep1);
> >     1205 
> > --> 1206         of_node_get(lnk);
> > 
> > So this of_node_get() undoes the put.  But if the reference count
> > dropped to zero then this would be a use afer free.
> 
> Thank you for pointing it.
> 
> This "lnk" is used as "port0", and of_node_get(lnk) was for it,
> but this function doesn't call of_node_put(port0).
> So yes, indeed this of_node_get() is not needed.
> Let's remove it. 

No no... of_get_next_child() will drop the reference.  It is needed.
The point is we should take the reference first before calling
of_get_next_child().

Maybe something like this:

	struct device_node *port1 = of_get_next_child(ports, of_node_get(lnk));

regards,
dan carpenter

