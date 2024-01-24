Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E396D1D6
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706100041; cv=none; b=dnG/zdnYUC1CNG3Pd3UARQqWots3CfZxKKXv5Wb4hkJ1NBRmn3TfutO7SQMy+HCh06omaJjb+BesR73pRbtZSdFcpns9CAJL3G9w98tQ1f5eoBzMAt1MVikjIQ8lHaEkDW4b0VqP+Njux3qIh9c+Iw2C+MjJnRvqaEvFB3AmZ6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706100041; c=relaxed/simple;
	bh=FZFP8leP7RAq5kGQxJmipIwDZPPhQviPXOnLVnpMR5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n8LPF0TkJD7pn1B2pb4BBJQJ6g2eKsRMDLjfqD4SD/vkUbxmEXV1YPJfkk5nXSiDa0eX86THgMklUrcVlPoEo63U88sLufbH0AkzfkS/QJi1q1Ilm5lMH3tnGc2+WSr0n2WD7Ph1bvfCpMEVof+Wa9aBSR5Ks2OikpkRHJ865H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8Vs0uKj; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8Vs0uKj"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-599c38cd9f5so335705eaf.1
        for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 04:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706100039; x=1706704839; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kWogWcbiiyuJh+FUerTxPBMWB5fr1e6cnL665YmIF/A=;
        b=e8Vs0uKjYDqSj6CHUU7flIOLt40Ks+AtFEo7BaQEDN/08Ti6o/RiiuaK264l8shTXB
         FyuRYmhD+qsmQRS0t3e/gJKCK9UAPPSNAaAmdrT6Tp4MUEQPrx7YYSVpX1z/aGKSes9J
         q9Jchlkif4hK2sX6gSd/hA8Q4o8N4egs9dCtEgMUrMe319Ssq+LEwv4AWt226S82LOwk
         A2b82b/K4NsGL+xl9jpYcEwCowltwf9ODmTFh3kKvDvtL6w2LQ/HPEN+c8tFS+oQeadp
         Flkwt+JSeAG0ZM0yaq90iDQnVWp3KIbjJLS5hw7ciwV/kdX2MT3EmuTertrtY5qfP+9S
         TK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706100039; x=1706704839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWogWcbiiyuJh+FUerTxPBMWB5fr1e6cnL665YmIF/A=;
        b=v2eQB60WFnpu6G2bFDgDQCRCkH1ep55h66/yW6tEu6cRCcaXdEjoXzQzEAzuSO3Tkf
         dFko4EEkhWzLwQXIVuXR1O83lPaVLRVCC4aADptZpVSqBzIHK2lJAwp5hBeXbuHx2bHw
         +5XlQ4ukuicpbRBzSKqJmXpQLOhf5acWWVPyNvQ6auTSFvRbgtvb9K6WePqDoRWmuqiy
         DRsKIhZUc/NKASrabLHCkayxLS2eW9qXa93usHj8TwPNTtScA70tUzzHh/IWf5wL3ZE+
         mNrBO5YGAzVXJ5HGyzys2uBJQSVEeOWFlBVc0PKWNQyXFOJnxDZtiL/CsGadQS5IXaaL
         fH4w==
X-Gm-Message-State: AOJu0YxaWw31xU5/prByn+qWrgLlm82wF4sSwvaqbPqN2L208cOzrZpp
	obR9yiFykWEprfFeAPW520fj0PxJAZEgsM8OMoIhg8sA26o9VKRvEhN9zpmPdDecC6NM0BXBwG+
	FCcq1ihm8TAvzm3MnOUinjTkApYp7kmCz
X-Google-Smtp-Source: AGHT+IHyUNMoe1WPRltarBaK5ChqVz54utp+rmgY1rxh0GGzt82eqUUiuTyYaabcgKvybe1H2CF3w37Gbg8KjnLvC1Y=
X-Received: by 2002:a4a:d00e:0:b0:599:79ce:67e5 with SMTP id
 h14-20020a4ad00e000000b0059979ce67e5mr1167571oor.8.1706100039049; Wed, 24 Jan
 2024 04:40:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124120834.49410-1-lirongqing@baidu.com>
In-Reply-To: <20240124120834.49410-1-lirongqing@baidu.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 24 Jan 2024 07:40:26 -0500
Message-ID: <CAJSP0QXP9KFSCO9mFkNmms=GKmMi+h4EjrVKf3Ng_BQV-LFiSQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: virtio: remove duplicate check if queue is broken
To: Li RongQing <lirongqing@baidu.com>
Cc: anton.yakovlev@opensynergy.com, mst@redhat.com, perex@perex.cz, 
	tiwai@suse.com, virtualization@lists.linux.dev, alsa-devel@alsa-project.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Jan 2024 at 07:17, Li RongQing <lirongqing@baidu.com> wrote:
>
> virtqueue_enable_cb() will call virtqueue_poll() which will check if
> queue is broken at beginning, so remove the virtqueue_is_broken() call
>
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>  sound/virtio/virtio_card.c    | 2 --
>  sound/virtio/virtio_ctl_msg.c | 2 --
>  sound/virtio/virtio_pcm_msg.c | 2 --
>  3 files changed, 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

>
> diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
> index e2847c0..b158c3c 100644
> --- a/sound/virtio/virtio_card.c
> +++ b/sound/virtio/virtio_card.c
> @@ -91,8 +91,6 @@ static void virtsnd_event_notify_cb(struct virtqueue *vqueue)
>                         virtsnd_event_dispatch(snd, event);
>                         virtsnd_event_send(vqueue, event, true, GFP_ATOMIC);
>                 }
> -               if (unlikely(virtqueue_is_broken(vqueue)))
> -                       break;
>         } while (!virtqueue_enable_cb(vqueue));
>         spin_unlock_irqrestore(&queue->lock, flags);
>  }
> diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
> index 18dc5ac..9dabea0 100644
> --- a/sound/virtio/virtio_ctl_msg.c
> +++ b/sound/virtio/virtio_ctl_msg.c
> @@ -303,8 +303,6 @@ void virtsnd_ctl_notify_cb(struct virtqueue *vqueue)
>                 virtqueue_disable_cb(vqueue);
>                 while ((msg = virtqueue_get_buf(vqueue, &length)))
>                         virtsnd_ctl_msg_complete(msg);
> -               if (unlikely(virtqueue_is_broken(vqueue)))
> -                       break;
>         } while (!virtqueue_enable_cb(vqueue));
>         spin_unlock_irqrestore(&queue->lock, flags);
>  }
> diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
> index 542446c..8c32efa 100644
> --- a/sound/virtio/virtio_pcm_msg.c
> +++ b/sound/virtio/virtio_pcm_msg.c
> @@ -358,8 +358,6 @@ static inline void virtsnd_pcm_notify_cb(struct virtio_snd_queue *queue)
>                 virtqueue_disable_cb(queue->vqueue);
>                 while ((msg = virtqueue_get_buf(queue->vqueue, &written_bytes)))
>                         virtsnd_pcm_msg_complete(msg, written_bytes);
> -               if (unlikely(virtqueue_is_broken(queue->vqueue)))
> -                       break;
>         } while (!virtqueue_enable_cb(queue->vqueue));
>         spin_unlock_irqrestore(&queue->lock, flags);
>  }
> --
> 2.9.4
>
>
