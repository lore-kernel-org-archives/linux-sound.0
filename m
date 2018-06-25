From: priyaranjan <priyaranjan45678@gmail.com>
Date: Mon, 25 Jun 2018 09:52:05 +0000
Subject: Re: audio samples data flow from user mode to kernel mode
Message-Id: <CAE_iR+hOBD=m8Crk7O2SFy8GkwyT4xLKZZghJM8c1VihwzJozw@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAPY=qRRw0oyJTs0qKHbWdn2wj_iHUzqmBQFPRip08yLU1pdXQw@mail.gmail.com>
In-Reply-To: <CAPY=qRRw0oyJTs0qKHbWdn2wj_iHUzqmBQFPRip08yLU1pdXQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Subhashini Rao Beerisetty <subhashbeerisetty@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>

Hi Subhashini,

On Sat, Jun 23, 2018 at 4:22 PM, Subhashini Rao Beerisetty
<subhashbeerisetty@gmail.com> wrote:
> Hello All,
>
>
>
> I’m trying to understand how audio samples transferred between user mode to
> kernel mode during playback and capture. I’m using aplay & arecord alsa
> utilities for playback and capture.
>
>
>
> Let us take a PCM wav file of sample rate 48000 and it has a total number of
> samples 480000 (Approx.Duration in seconds=10). Size of each sample is 8
> bytes(two channels). After invocation of aplay from user mode, how does
> these audio samples gets copied to kernel mode? Can someone explain me on
> this?
>

Usually this is done in corresponding sound/alsa device driver.
The alsa driver should populate the following structure :-

struct snd_pcm_substream {
struct snd_pcm *pcm;
struct snd_pcm_str *pstr;
void *private_data; /* copied from pcm->private_data */
int number;
char name[32]; /* substream name */
int stream; /* stream (direction) */
struct pm_qos_request latency_pm_qos_req; /* pm_qos request */
size_t buffer_bytes_max; /* limit ring buffer size */
struct snd_dma_buffer dma_buffer;
size_t dma_max;
/* -- hardware operations -- */
const struct snd_pcm_ops *ops;

Here, you can find the dma_buffer where you have to populate the
destination(kernel buffer)
I would suggest please have a look at Alsa driver documentation for
further details.
There are lot of important parameters which defines how the copy will
happen from
user-space to kernel space - like period size, period count etc. Also
look at important
functions - snd_pcm_period_elapsed etc

>
>
> Is it possible to capture the timestamps for the first and last audio
> samples that arrive at the driver level?
>
>
>
> Can I consider the .trigger(for playback & capture) callback in
> SNDRV_PCM_TRIGGER_START  case is timestamp for the first audio sample?
>
>
>
> Similarly does .trigger callbacks SNDRV_PCM_TRIGGER_STOP gives the last
> audio sample timestamp?
>
>
>
> Thanks,
>
>
> _______________________________________________
> Kernelnewbies mailing list
> Kernelnewbies@kernelnewbies.org
> https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies
>
