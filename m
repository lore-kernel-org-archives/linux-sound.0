Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14A328F513
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712879; cv=none; b=H4HS+kT4lRWy/YkgKugp06RfGdIhuXnQqWg7vt5OKuJsAqFy333e+aL9gZfrDyjnNPF1JQtmZOad2IGZK1Djm2zivg0dXj4lqz3KuwipN1utEDmznSbaFcX3I2NuUpuxgfXgnnpDlbghQhWfmwlonS2TEL4HTjFWVMEDovBfv7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712879; c=relaxed/simple;
	bh=JHYA8QSaCFv/pUc7BfntRZBD4CVb9/aj1x6zRnwxdgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XoRED9Y4OFLFc/Or5YfiPci5oUWJvyOsIENy0BbHlpq4eD8dGZuoNgM6mSSv9e61EEFhK6N6+heTnmqrPSemRohzQw+2oT50Ndoq4aiWq4viPtKBbqzJa+2OqQQwFZDCUyt1jGcoRvRWMdMbTEAjPJrazre+ofH2egkhWJQIv9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lepXw3Z5; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lepXw3Z5"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c14016868so4918363f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 03:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744712876; x=1745317676; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0kslnve49pbtT1c6ufSkKOBhGalhZ5NYtoLCxOyedUY=;
        b=lepXw3Z5ovs2iNKR0K4gQQAzizWi6moB7AQkzJTeK1XZ9wWCBRq1ehoe0hr+JxtfS4
         MHpBdwCN99i/MbQTltTolqK8uWRKUMSaoIzziHuVEu2B4SKqQG10MyyC34ORF59UUOaI
         QLgaCpXs5r2im+fUrVmw5WCeRe9qZMxlLgD7zjaErPsKRWCFgba6rruGNLKPNP7qJHxt
         mmuepOv+WSfBb7kTWeu27TKmir3B/3wnSHElRjiO9sdWLGYoSGSH5AwTpJ2zMev+YGpt
         Fc7SUyKrinfDx5cmPet9AUYUeFGxilCaJRbwdibO4AowZb57CKqDoIMXecMl7HgZXNpZ
         0hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712876; x=1745317676;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0kslnve49pbtT1c6ufSkKOBhGalhZ5NYtoLCxOyedUY=;
        b=hNT9/mVhWEblBAkUpKFmKpouwgl0Ja51hSsJsZg8inFqsX/tSMQy5g8Ehw7ujyqU1t
         Fg9daFaOdo/QpLM5S9S9awLalXpE9YJJIeHi5XCYcWLtMsQGwGe5qrPT1lzv3fxgBnSD
         SBj/DToTBib2c4FS90fC+XB6QyKW0wiOXeJOXrUWdNNiDxlVkFjD8ETEar+i95vURw6Y
         BCVdhbpFUCBCnRt8XjMoEXzDu3Ab5Oes5weW5QHQoIrpJz6JgvZ4NG/1tkhstphVQweP
         3C61WwIf9emZQEbd78W/0R003oNFdYw0xmnNGDZMiqAbVCDbI69EatMGx1FdXS2rMBau
         WgnQ==
X-Gm-Message-State: AOJu0YwTtIJ0eVlPldioK5rNfZ9U9qkcUNKQpzdg+lFRADEWwxTWG4Gu
	XXW6j4biR8Tq6eAYOyWLoyWx6jzN6QgOK5vkR0V8ZWu8rUe5KiNyRhSYzpa3u7Q=
X-Gm-Gg: ASbGnctgBPdvG02oYFWMrj/Hbj6rA1ISgPfBVIMsODZ4QoQ19+Rbe/7T5aVBhxDCvDz
	daJAUwKqhInKpZpIy+nHCijEBJoAcAip6bHHsZmdixjya0/BMdw425JCA3KOeNxqTI/dx2UPuWR
	qVJYt6iQZdUfbNIUEJuT7CcnsWCJLLwTFr2iOAchdZZo4itSk0Dp48NdxezTipYkYo8aACvi8DG
	UDgtX3At52FXyklVlsGgCKFijNiJ1saLYcwMaHWgYxE1WotHnEWvnlc+HqJrOggwaKyonmjbhy/
	Ww6PYfKGfJYpaWy8Gvr9oHzmRN4H7IJgx/Sc914/t2zKvX36R7yUTEEI
X-Google-Smtp-Source: AGHT+IEh33hDNIfKCPUptSDm+ieBLsDcGJwqrLw8uMRjGou/1xnMJXtinyCFsAKjYRygcWYAYwA2yA==
X-Received: by 2002:a5d:64e6:0:b0:391:3406:b4e2 with SMTP id ffacd0b85a97d-39eaaedca74mr11702706f8f.49.1744712875988;
        Tue, 15 Apr 2025 03:27:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f2338db88sm206742755e9.6.2025.04.15.03.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:27:55 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:27:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ALSA: usb-audio: qcom: Introduce QC USB SND offloading
 support
Message-ID: <Z_40qL4JnyjR4j0O@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Wesley Cheng,

Commit 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND
offloading support") from Apr 9, 2025 (linux-next), leads to the
following Smatch static checker warning:

	sound/usb/qcom/qc_audio_offload.c:1364 prepare_qmi_response()
	warn: missing error code here? 'snd_soc_usb_find_priv_data()' failed. 'ret' = '0'

sound/usb/qcom/qc_audio_offload.c
    1335 static int prepare_qmi_response(struct snd_usb_substream *subs,
    1336                                 struct qmi_uaudio_stream_req_msg_v01 *req_msg,
    1337                                 struct qmi_uaudio_stream_resp_msg_v01 *resp,
    1338                                 int info_idx)
    1339 {
    1340         struct q6usb_offload *data;
    1341         int pcm_dev_num;
    1342         int card_num;
    1343         u8 *xfer_buf = NULL;
    1344         int ret;
    1345 
    1346         pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
    1347         card_num = (req_msg->usb_token & QMI_STREAM_REQ_CARD_NUM_MASK) >> 16;
    1348 
    1349         if (!uadev[card_num].ctrl_intf) {
    1350                 dev_err(&subs->dev->dev, "audio ctrl intf info not cached\n");
    1351                 ret = -ENODEV;
    1352                 goto err;
    1353         }
    1354 
    1355         ret = uaudio_populate_uac_desc(subs, resp);
    1356         if (ret < 0)
    1357                 goto err;
    1358 
    1359         resp->slot_id = subs->dev->slot_id;
    1360         resp->slot_id_valid = 1;
    1361 
    1362         data = snd_soc_usb_find_priv_data(uaudio_qdev->auxdev->dev.parent);
    1363         if (!data)
--> 1364                 goto err;

error code?  It's probably better to return directly because it often
helps avoid "forgot set the error code" bugs.  Also it's more readable.

    1365 
    1366         uaudio_qdev->data = data;
    1367 
    1368         resp->std_as_opr_intf_desc_valid = 1;
    1369         ret = uaudio_endpoint_setup(subs, subs->data_endpoint, card_num,
    1370                                     &resp->xhci_mem_info.tr_data,
    1371                                     &resp->std_as_data_ep_desc);
    1372         if (ret < 0)
    1373                 goto err;
    1374 
    1375         resp->std_as_data_ep_desc_valid = 1;
    1376 
    1377         if (subs->sync_endpoint) {
    1378                 ret = uaudio_endpoint_setup(subs, subs->sync_endpoint, card_num,
    1379                                             &resp->xhci_mem_info.tr_sync,
    1380                                             &resp->std_as_sync_ep_desc);
    1381                 if (ret < 0)
    1382                         goto drop_data_ep;
    1383 
    1384                 resp->std_as_sync_ep_desc_valid = 1;
    1385         }
    1386 
    1387         resp->interrupter_num_valid = 1;
    1388         resp->controller_num_valid = 0;
    1389         ret = usb_get_controller_id(subs->dev);
    1390         if (ret >= 0) {
    1391                 resp->controller_num = ret;
    1392                 resp->controller_num_valid = 1;
    1393         }
    1394 
    1395         /* event ring */
    1396         ret = uaudio_event_ring_setup(subs, card_num,
    1397                                       &resp->xhci_mem_info.evt_ring);
    1398         if (ret < 0)
    1399                 goto drop_sync_ep;
    1400 
    1401         uaudio_qdev->er_mapped = true;
    1402         resp->interrupter_num = xhci_sideband_interrupter_id(uadev[card_num].sb);
    1403 
    1404         resp->speed_info = get_speed_info(subs->dev->speed);
    1405         if (resp->speed_info == USB_QMI_DEVICE_SPEED_INVALID_V01) {
    1406                 ret = -ENODEV;
    1407                 goto free_sec_ring;
    1408         }
    1409 
    1410         resp->speed_info_valid = 1;
    1411 
    1412         ret = uaudio_transfer_buffer_setup(subs, xfer_buf, req_msg->xfer_buff_size,
    1413                                            &resp->xhci_mem_info.xfer_buff);
    1414         if (ret < 0) {
    1415                 ret = -ENOMEM;
    1416                 goto free_sec_ring;
    1417         }
    1418 
    1419         resp->xhci_mem_info_valid = 1;
    1420 
    1421         if (!atomic_read(&uadev[card_num].in_use)) {
    1422                 kref_init(&uadev[card_num].kref);
    1423                 init_waitqueue_head(&uadev[card_num].disconnect_wq);
    1424                 uadev[card_num].num_intf =
    1425                         subs->dev->config->desc.bNumInterfaces;
    1426                 uadev[card_num].info = kcalloc(uadev[card_num].num_intf,
    1427                                                sizeof(struct intf_info),
    1428                                                GFP_KERNEL);
    1429                 if (!uadev[card_num].info) {
    1430                         ret = -ENOMEM;
    1431                         goto unmap_er;
    1432                 }
    1433                 uadev[card_num].udev = subs->dev;
    1434                 atomic_set(&uadev[card_num].in_use, 1);
    1435         } else {
    1436                 kref_get(&uadev[card_num].kref);
    1437         }
    1438 
    1439         uadev[card_num].usb_core_id = resp->controller_num;
    1440 
    1441         /* cache intf specific info to use it for unmap and free xfer buf */
    1442         uadev[card_num].info[info_idx].data_xfer_ring_va =
    1443                                         IOVA_MASK(resp->xhci_mem_info.tr_data.va);
    1444         uadev[card_num].info[info_idx].data_xfer_ring_size = PAGE_SIZE;
    1445         uadev[card_num].info[info_idx].sync_xfer_ring_va =
    1446                                         IOVA_MASK(resp->xhci_mem_info.tr_sync.va);
    1447         uadev[card_num].info[info_idx].sync_xfer_ring_size = PAGE_SIZE;
    1448         uadev[card_num].info[info_idx].xfer_buf_va =
    1449                                         IOVA_MASK(resp->xhci_mem_info.xfer_buff.va);
    1450         uadev[card_num].info[info_idx].xfer_buf_pa =
    1451                                         resp->xhci_mem_info.xfer_buff.pa;
    1452         uadev[card_num].info[info_idx].xfer_buf_size =
    1453                                         resp->xhci_mem_info.xfer_buff.size;
    1454         uadev[card_num].info[info_idx].data_ep_pipe = subs->data_endpoint ?
    1455                                                 subs->data_endpoint->pipe : 0;
    1456         uadev[card_num].info[info_idx].sync_ep_pipe = subs->sync_endpoint ?
    1457                                                 subs->sync_endpoint->pipe : 0;
    1458         uadev[card_num].info[info_idx].data_ep_idx = subs->data_endpoint ?
    1459                                                 subs->data_endpoint->ep_num : 0;
    1460         uadev[card_num].info[info_idx].sync_ep_idx = subs->sync_endpoint ?
    1461                                                 subs->sync_endpoint->ep_num : 0;
    1462         uadev[card_num].info[info_idx].xfer_buf = xfer_buf;
    1463         uadev[card_num].info[info_idx].pcm_card_num = card_num;
    1464         uadev[card_num].info[info_idx].pcm_dev_num = pcm_dev_num;
    1465         uadev[card_num].info[info_idx].direction = subs->direction;
    1466         uadev[card_num].info[info_idx].intf_num = subs->cur_audiofmt->iface;
    1467         uadev[card_num].info[info_idx].in_use = true;
    1468 
    1469         set_bit(card_num, &uaudio_qdev->card_slot);
    1470 
    1471         return 0;
    1472 
    1473 unmap_er:
    1474         uaudio_iommu_unmap(MEM_EVENT_RING, IOVA_BASE, PAGE_SIZE, PAGE_SIZE);
    1475 free_sec_ring:
    1476         xhci_sideband_remove_interrupter(uadev[card_num].sb);
    1477 drop_sync_ep:
    1478         if (subs->sync_endpoint) {
    1479                 uaudio_iommu_unmap(MEM_XFER_RING,
    1480                                    IOVA_MASK(resp->xhci_mem_info.tr_sync.va),
    1481                                    PAGE_SIZE, PAGE_SIZE);
    1482                 xhci_sideband_remove_endpoint(uadev[card_num].sb,
    1483                         usb_pipe_endpoint(subs->dev, subs->sync_endpoint->pipe));
    1484         }
    1485 drop_data_ep:
    1486         uaudio_iommu_unmap(MEM_XFER_RING, IOVA_MASK(resp->xhci_mem_info.tr_data.va),
    1487                            PAGE_SIZE, PAGE_SIZE);
    1488         xhci_sideband_remove_endpoint(uadev[card_num].sb,
    1489                         usb_pipe_endpoint(subs->dev, subs->data_endpoint->pipe));
    1490 
    1491 err:
    1492         return ret;
    1493 }

regards,
dan carpenter
